Build Drupal Image:
  dockerng.image_present:
    - name: myapp/drupal
    - base: php:7.0-apache-python
    - sls: docker.drupal
