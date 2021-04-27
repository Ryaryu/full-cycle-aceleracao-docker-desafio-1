create table `modulo` (
    `id` int auto_increment,
    `nome` varchar(255) not null,
    primary key(`id`)
);

insert into `modulo` (nome) values ('Docker'),
                                   ('Fundamentos da Arquitetura de Software'),
                                   ('Comunicação'),
                                   ('RabbitMQ'),
                                   ('Autenticação e Keycloak'),
                                   ('Domain Driven Design e Arquitetura Hexagonal'),
                                   ('Arquitetura do Projeto Prático - Codeflix'),
                                   ('Microsserviço: Catálogo de vídeos com Laravel (Back-end)');