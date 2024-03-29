var config = {
  dev: {
    url: "http://localhost/",
    port: 21026,
    ambiente: "DEV",
    database: {
      host: "delivery-feparmezani.a.aivencloud.com", // Variável de ambiente para o endereço do servidor
      port: "23663", // Variável de ambiente para a porta
      user: "avnadmin", // Variável de ambiente para o nome de usuário
      password: "AVNS_k6EotLv50qRf5k-Lwvj", // Variável de ambiente para a senha
      database: "pizzaria", // Variável de ambiente para o nome do banco de dados
    },
  },
  prod: {
    url: "https://www.menumagic.com.br",
    port: 21026,
    ambiente: "PROD",
    database: {
      host: "delivery-feparmezani.a.aivencloud.com", // Variável de ambiente para o endereço do servidor
      port: "23663", // Variável de ambiente para a porta
      user: "avnadmin", // Variável de ambiente para o nome de usuário
      password: "AVNS_k6EotLv50qRf5k-Lwvj", // Variável de ambiente para a senha
      database: "pizzaria", // Variável de ambiente para o nome do banco de dados
    },
  },
};

exports.get = function get(ambiente) {
  if (ambiente.toLowerCase() === "dev") {
    return config.dev;
  }

  if (ambiente.toLowerCase() === "prod") {
    return config.prod;
  }
};
