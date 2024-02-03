var config = {
  dev: {
    url: "http://localhost/",
    port: process.env.APP_PORT || 3000,
    ambiente: "DEV",
    database: {
      host: process.env.HOST, // Variável de ambiente para o endereço do servidor
      port: process.env.PORT, // Variável de ambiente para a porta
      user: process.env.USERNAME, // Variável de ambiente para o nome de usuário
      password: process.env.PASSWORD, // Variável de ambiente para a senha
      database: process.env.DATABASE_NAME, // Variável de ambiente para o nome do banco de dados
    },
  },
};

exports.get = function get(ambiente) {
  if (ambiente.toLowerCase() === "dev") {
    return config.dev;
  }
};
