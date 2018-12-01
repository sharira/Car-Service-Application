my_app:
  docker_image.present:
    - force: true
    - name: my_apache2:latest

my_app2:
  docker_container.running:
    - name: my_adpp
    - image: my_apache2:latest
    - port_bindings: 80:80
