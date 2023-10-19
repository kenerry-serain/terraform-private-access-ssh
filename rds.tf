resource "aws_rds_cluster_instance" "cluster_instances" {
  identifier           = "youtube-pg-instance"
  cluster_identifier   = aws_rds_cluster.default.id
  instance_class       = "db.t3.medium"
  engine               = "aurora-postgresql"
  engine_version       = aws_rds_cluster.default.engine_version
  publicly_accessible  = false
  availability_zone    = "us-east-1a"
  db_subnet_group_name = aws_db_subnet_group.default.name
  apply_immediately    = true
  tags                 = var.tags
}

resource "aws_rds_cluster" "default" {
  cluster_identifier        = "youtube-pg"
  availability_zones        = ["us-east-1a", "us-east-1b"]
  master_username           = "postgres"
  master_password           = "Define-Me0!"
  engine                    = "aurora-postgresql"
  skip_final_snapshot       = false
  deletion_protection       = true
  vpc_security_group_ids    = [aws_security_group.allow_rds.id]
  db_subnet_group_name      = aws_db_subnet_group.default.name
  tags                      = var.tags
}

resource "aws_db_subnet_group" "default" {
  name       = "salesbox-prd-group"
  subnet_ids = [for subnet in aws_subnet.private_subnets : subnet].*.id
  tags = var.tags
}
