CREATE TABLE usuario (
    id                    INT AUTO_INCREMENT PRIMARY KEY,                                  
    name                  VARCHAR(255) NOT NULL,                                           
    email                 VARCHAR(255) NOT NULL UNIQUE,                                    
    senha                 VARCHAR(255) NOT NULL,                                      
    data_criacao          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             
    data_atualizacao      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE monitor (
    id                    INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario            INT NOT NULL,
    name                  VARCHAR(255) NOT NULL, 

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

