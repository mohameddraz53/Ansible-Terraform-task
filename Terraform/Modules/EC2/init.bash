  #!/bin/bash
  yum update -y
  yum install httpd -y
  
  service httpd start
  chkconfig httpd on
  
  cd /var/www/html
  
  echo "<html><h1>Hello Cloud Gurus Welcome To My Webpage</h1></html>" >index.html
  aws eks --region use-east-1 describe-cluster --name demo --query clusetr.status