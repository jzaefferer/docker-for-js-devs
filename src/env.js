let env = {
  PETS_API_URL: 'http://localhost:7777/'
}

if (window.env && window.env !== '%%RUNTIME_ENV%%') {
  env = Object.assign({}, window.env)
}

export default env
