var config = {
  dev: {
    url: "http://localhost/",
    port: 3000,
    ambiente: "DEV",
    database: {
      host: "delivery-feparmezani.a.aivencloud.com",
      port: "23663",
      user: "avnadmin",
      password: "AVNS_k6EotLv50qRf5k-Lwvj",
      database: "pizzaria",
    },
  },
};

exports.get = function get(ambiente) {
  if (ambiente.toLowerCase() === "dev") {
    return config.dev;
  }
};
