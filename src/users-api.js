import axios from "axios";

var api = axios.create({
  baseURL: 'https://users.vapor.codes/'
});

var headers = {};
api.interceptors.request.use(
  request => {
    console.log(`[${request.method}] ${request.url}`, request.data)
    for (var name in headers) {
      if (headers[name]) {
        request.headers.common[name] = headers[name];
      }
    }
    return request;
  },
  error => {
    /* eslint-disable */
    console.log(error);
    /* eslint-enable */
  }
);

api.interceptors.response.use(
  response => {
    return response;
  },
  error => {
    if (
      error.response &&
      error.response.data &&
      error.response.data.error === true
    ) {
      return Promise.reject(new Error(error.response.data.reason));
    } else {
      return Promise.reject(error);
    }
  }
);

export default {
  headers: headers,
  login(email, password) {
    return api
      .post("/login", { email, password })
      .then(res => res.data)
      .catch(err => {
        if (err.message.includes("Invalid")) {
          throw new Error("Invalid email or password.");
        } else {
          throw err;
        }
      });
  },
  register(name, email, password) {
    return api
      .post("/register", { name, email, password })
      .then(res => res.data);
  },
  me() {
    return api.get('/me').then(res => res.data)
  }
};
