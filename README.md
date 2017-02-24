# Capistrano Resource

Enables you to run [Capistrano](http://capistranorb.com/) deployments from your pipeline.

## Source Configuration

* `stage`: *Required.* The name of the stage to execute during deployment.

* `private_key`: *Required.* The private key to use during deployment.

### Example

Resource configuration for production environment:

``` yaml
resources:
- name: production-deployment
  type: capistrano
  source:
    stage: production
    private_key: |
      -----BEGIN RSA PRIVATE KEY-----
      MIISKAIBAAKCBAEAyx0Gxg1Ph2MqLb5ogJHq0jGSDqgGqiLOyK771l5PhbAUYDXc
      <Lots more text>
      RBBTrpwGkMUvgGExiqEGNPzut9v9vTIczSifCzgD7vLra9NNv67J2Kt7zOM=
      -----END RSA PRIVATE KEY-----
```

Deploying to production:

``` yaml
- get: source-code
- put: production-deployment
  params:
    path: source-code
```

## Behavior

### `check`: Not supported.

### `in`: Not supported

### `out`: Run deployment.

#### Parameters

* `path`: *Required.* The path to the directory that contains the Capistrano configuration.
