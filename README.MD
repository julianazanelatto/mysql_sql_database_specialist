<div align="center">
  <img src="banner-mysql.jpg" alt="Banner MySQL SQL Database Specialist" width="100%">
</div>

# Repositório: mysql_sql_database_specialist

[![Status](https://img.shields.io/badge/STATUS-AI%20ENGINEER-brightgreen)](https://github.com/Rafael-TOZATO)
[![Qualidade](https://img.shields.io/badge/QUALIDADE-ISO%209001-blue)](https://github.com/Rafael-TOZATO)
[![Governança](https://img.shields.io/badge/GOVERNANÇA-INDÚSTRIA%204.0-orange)](https://github.com/Rafael-TOZATO)
[![Python](https://img.shields.io/badge/PYTHON-AI-yellow)](https://github.com/Rafael-TOZATO)
[![Lean Six Sigma](https://img.shields.io/badge/LEAN%20SIX%20SIGMA-GREEN%20BELT-purple)](https://github.com/Rafael-TOZATO)

---

## 📋 Descrição do Projeto

Repositório oficial e estruturado para a formação avançada de **MySQL SQL Database Specialist**, focado no design de arquiteturas relacionais, modelagem conceitual e lógica de bancos de dados, modelagem dimensional, manipulação avançada via DDL/DML, otimização de performance com índices, controle de concorrência, transações seguras e estratégias robustas de backup e recuperação.

---

## 📂 Estrutura Detalhada do Repositório

```text
mysql_sql_database_specialist/
│
├── Módulo 3/
│   ├── curso1/                        # Modelagem de dados e diagramas (MySQL Workbench e Draw.io)
│   │   ├── ordemdeservico.drawio      # Diagrama de arquitetura e fluxo de ordem de serviço
│   │   ├── orderm de serviço.mwb      # Modelo físico/lógico em MySQL Workbench
│   │   ├── universidade.mwb           # Modelo relacional do domínio acadêmico (Universidade)
│   │   └── universidade_refinado.mwb  # Versão refinada e normalizada do modelo acadêmico
│   ├── curso2/                        # Criação de bases e scripts fundamentais (Company DB)
│   │   ├── criando _db_company.sql    # Script DDL de inicialização do banco de dados Company
│   │   ├── esquema_básico.sql         # Definição das tabelas base e restrições de integridade
│   │   ├── first_example_queries.sql  # Primeiras consultas de seleção e projeção
│   │   └── insercao_de_dados_e_queries_sql.sql # Popular tabelas e consultas transacionais iniciais
│   ├── curso3/                        # Filtragem avançada e subconsultas
│   │   ├── ddl_commands.sql           # Comandos de definição e alteração de estruturas (DDL)
│   │   ├── like_between_query_sql.sql # Operadores de comparação avançada (LIKE, BETWEEN)
│   │   ├── subqueries_with_mysql.sql  # Consultas aninhadas e subqueries condicionais
│   │   └── union_intersect_exception.sql # Operações de conjuntos relacionais (UNION, INTERSECT)
│   ├── curso4/                        # Agrupamentos, ordenação e funções de agregação
│   │   ├── grouping_functions_and_clausules.sql # Funções de agregação e cláusulas GROUP BY / HAVING
│   │   ├── ordenacao_mysql.sql        # Ordenação de conjuntos de resultados
│   │   └── order_by_with_mysql.sql    # Ordenação avançada com critérios múltiplos
│   ├── curso5/                        # Junções relacionais avançadas (Joins)
│   │   ├── join_statement.sql         # Conceitos fundamentais de Inner, Outer e Cross Joins
│   │   └── join_statement_with_mysql.sql # Implementação prática de joins complexos no MySQL
│   └── desafio/                       # Projeto Prático Integrado (E-commerce)
│       ├── ecommerce.mwb              # Modelo relacional completo do sistema de E-commerce
│       ├── ecommerce_relational_schema.png # Diagrama visual do esquema relacional normalizado
│       ├── esquema_relacional_sql.sql # Script de criação estrutural do banco E-commerce
│       └── queries_and_data_insertion.sql # Inserção de massa de dados e queries analíticas
│
├── Módulo 4/
│   ├── DDL & Esquema/                 # Governança de esquemas e alterações estruturais avançadas
│   ├── SQL Dinâmico/                  # Execução de comandos SQL construídos em tempo de execução
│   ├── Índice/                        # Otimização de consultas, índices b-tree e performance de busca
│   ├── Gatilhos/                      # Automação de regras de negócio com Triggers
│   └── Opiniões/                      # Análise de planos de execução e otimização de queries
│
├── Módulo 5/
│   ├── Backup e Recuperação/          # Estratégias de disaster recovery, dump e restauração segura
│   ├── Controle de Concorrência/      # Gerenciamento de locks, isolamento e concorrência transacional
│   └── Transações/                    # Conformidade ACID, controle de commit, rollback e savepoints
│
├── Captura de tela de 2023-10-02...   # Evidências e capturas de validação arquitetural
└── README.md                          # Documentação central do repositório
