def test_apache2(host):
    apache2 = host.package("apache2")
    assert apache2.is_installed
def test_mysqlserver(host):
    mysqlserver = host.package("mysql-server")
    assert mysqlserver.is_installed
def test_mysqlclient(host):
    mysqlclient = host.package("mysql-client")
    assert mysqlclient.is_installed
def test_firewalld(host):
    firewalld = host.package("firewalld")
    assert firewalld.is_installed
def test_phpmysql(host):
    phpmysql = host.package("php-mysql")
    assert phpmysql.is_installed
