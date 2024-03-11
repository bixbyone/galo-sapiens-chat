#api.sh   #author: zeh sobrinho & tutorC
#date: 10-03-24
#vesão: 1.0.1 

#!/usr/bin/env bash

source ../config/api.conf

# Função para realizar transações
function transacao {

  local cliente_id="${1}"
  local valor="${2}"
  local tipo="${3}" 
  local descricao="${4}"

  # Valida os parâmetros obrigatórios
  if [[ -z "${cliente_id}" || -z "${valor}" || -z "${tipo}" || -z "${descricao}" ]]; then
    echo '{"erro": "Parâmetros obrigatórios não informados"}'
    return 1
  fi

  # Valida tipo de transação
  if [[ "${tipo}" != "c" && "${tipo}" != "d" ]]; then
    echo '{"erro": "Tipo de transação inválido"}'    
    return 2
  fi

  # Converte valor para número
  valor=$(echo "${valor}" | awk '{printf("%f\n",$0)}')

  # Realiza a transação no banco
  sqlite3 "${DB_FILE}" "
    INSERT INTO 
      transacoes (cliente_id, valor, tipo, descricao)
    VALUES
      ('${cliente_id}', '${valor}', '${tipo}', '${descricao}');

    -- Atualiza saldo do cliente
    UPDATE 
      clientes 
    SET 
      saldo = saldo + CASE 
        WHEN tipo = 'c' THEN valor
        WHEN tipo = 'd' THEN -valor
        ELSE 0
      END
    WHERE 
      id = '${cliente_id}';
  "

  # Verifica erro
  if [[ "$?" != "0" ]]; then
    echo '{"erro": "Erro ao realizar a transação"}'
    return 3   
  fi

  # Retorna resultado
  echo '{"msg": "Transação realizada com sucesso"}'

}

# Função para obter extrato
function extrato {

  local cliente_id="${1}"

  # Valida parâmetro obrigatório
  if [[ -z "${cliente_id}" ]]; then
    echo '{"erro": "Parâmetro cliente_id é obrigatório"}'
    return 1
  fi  

  # Obtém dados do cliente no banco
  local resultado=$(sqlite3 "${DB_FILE}" "
    SELECT 
      c.id, c.nome, c.limite, c.saldo, json_agg(t) as transacoes
    FROM 
      clientes c
      LEFT JOIN transacoes t ON t.cliente_id = c.id
    WHERE
      c.id = '${cliente_id}'ls
    GROUP BY c.id
  ")

  # Verifica erro
  if [[ "$?" != "0" ]]; then
    echo '{"erro": "Erro ao obter extrato"}'
    return 2
  fi

  # Retorna resultado
  echo "${resultado}"

}

# Inicializa banco de dados
sqlite3 "${DB_FILE}" ".read init.sql"

# Roda servidor HTTP
exec curl --data "{"http://nginx:80/transacao\"}"