CREATE TABLE usuario (
    id                    INT AUTO_INCREMENT PRIMARY KEY,                                  
    nome                  VARCHAR(255) NOT NULL,                                           
    email                 VARCHAR(255) NOT NULL UNIQUE,                                    
    senha                 VARCHAR(255) NOT NULL,                                      
    data_criacao          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             
    data_atualizacao      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE monitor (
    id                    INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario            INT NOT NULL,
    nome                  VARCHAR(255) NOT NULL, 

    tipo_monitor          ENUM('HTTP', 'PING', 'PORT') NOT NULL, 
    alvo                  VARCHAR(2048) NOT NULL,                              
    porta                 INT NULL,                                              
    
    
    intervalo_verificacao INT NOT NULL DEFAULT 300,
    esta_ativo            BOOLEAN NOT NULL DEFAULT TRUE,
    ultimo_status         ENUM('UP', 'DOWN', 'PENDING') NOT NULL DEFAULT 'PENDING',
    ultima_verificacao    TIMESTAMP NULL,
    data_criacao          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE CASCADE
);

INSERT INTO usuario (id, nome, email, senha) VALUES (1, 'Felipe Caue Machado', 'fmachad6@gmail.com',  '1234');

INSERT INTO monitor (id_usuario, nome, tipo_monitor, alvo, porta, intervalo_verificacao, esta_ativo, ultimo_status, ultima_verificacao) VALUES (1, 'Monitor do Google', 'HTTP', 'https://www.google.com', NULL, 300, TRUE, 'PENDING', NULL);
INSERT INTO monitor (id_usuario, nome, tipo_monitor, alvo, porta, intervalo_verificacao, esta_ativo, ultimo_status, ultima_verificacao) VALUES (1, 'Ping para Google DNS', 'PING', '8.8.8.8', NULL, 60, TRUE, 'PENDING', NULL);
INSERT INTO monitor (id_usuario, nome, tipo_monitor, alvo, porta, intervalo_verificacao, esta_ativo, ultimo_status, ultima_verificacao) VALUES (1, 'Porta SSH do Servidor Fabtec', 'PORT', '192.168.0.10', 22, 120, TRUE, 'PENDING', NULL);
INSERT INTO monitor (id_usuario, nome, tipo_monitor, alvo, porta, intervalo_verificacao, esta_ativo, ultimo_status, ultima_verificacao) VALUES (1, 'Site Institucional IFC', 'HTTP', 'https://ifc-riodosul.edu.br', NULL, 180, TRUE, 'PENDING', NULL);


