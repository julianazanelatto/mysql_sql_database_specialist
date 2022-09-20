-- bank account

/*
Esquema reduzido para exemplificação

cliente (id, cpf, rg, nome, end, data_nascimento, renda_mensal)
agencia (id, n_agencia, end)
conta poupança(id, n_contac, n_agencia(fk))
conta conrrente(id, n_poupanca, variacao, n_agencia(fk))

*/