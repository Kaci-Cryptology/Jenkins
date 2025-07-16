# Formation AWS Cloud pour DevOps - Cours Complet

## Table des Matières

1. [Introduction à AWS](#introduction-à-aws)
2. [Architecture et Concepts Fondamentaux](#architecture-et-concepts-fondamentaux)
3. [Identité et Gestion des Accès (IAM)](#identité-et-gestion-des-accès-iam)
4. [Services de Calcul](#services-de-calcul)
5. [Services de Stockage](#services-de-stockage)
6. [Services de Réseau](#services-de-réseau)
7. [Base de Données](#base-de-données)
8. [Services DevOps et CI/CD](#services-devops-et-cicd)
9. [Monitoring et Observabilité](#monitoring-et-observabilité)
10. [Sécurité AWS](#sécurité-aws)
11. [Infrastructure as Code (IaC)](#infrastructure-as-code-iac)
12. [Conteneurisation et Orchestration](#conteneurisation-et-orchestration)
13. [Serverless et Functions](#serverless-et-functions)
14. [Optimisation des Coûts](#optimisation-des-coûts)
15. [Migration et Modernisation](#migration-et-modernisation)
16. [Bonnes Pratiques DevOps sur AWS](#bonnes-pratiques-devops-sur-aws)
17. [Projets Pratiques](#projets-pratiques)

---

## 1. Introduction à AWS

### Qu'est-ce qu'AWS ?

Amazon Web Services (AWS) est la plateforme cloud la plus complète et largement adoptée au monde. Elle offre plus de 200 services pour le calcul, le stockage, la base de données, l'analyse, la mise en réseau, le mobile, les outils de développement, les outils de gestion, l'IoT, la sécurité et les applications d'entreprise.

### Modèles de Cloud Computing

#### 1. Infrastructure as a Service (IaaS)
- **Définition** : Fournit les ressources informatiques de base
- **Exemples AWS** : EC2, VPC, EBS
- **Avantages** : Contrôle total, flexibilité maximale
- **Inconvénients** : Plus de gestion requise

#### 2. Platform as a Service (PaaS)
- **Définition** : Plateforme pour développer et déployer des applications
- **Exemples AWS** : Elastic Beanstalk, Lambda, RDS
- **Avantages** : Moins de gestion d'infrastructure
- **Inconvénients** : Moins de contrôle

#### 3. Software as a Service (SaaS)
- **Définition** : Applications prêtes à l'emploi
- **Exemples AWS** : WorkMail, Chime, QuickSight
- **Avantages** : Prêt à utiliser immédiatement
- **Inconvénients** : Personnalisation limitée

### Modèles de Déploiement

#### 1. Cloud Public
- Ressources détenues et exploitées par AWS
- Partagées entre plusieurs organisations
- Accès via Internet

#### 2. Cloud Privé
- Ressources utilisées exclusivement par une organisation
- Peut être hébergé sur site ou par un tiers

#### 3. Cloud Hybride
- Combinaison de cloud public et privé
- Permet la migration graduelle

### Avantages d'AWS pour DevOps

1. **Scalabilité** : Adaptation automatique aux besoins
2. **Fiabilité** : SLA élevés et redondance
3. **Sécurité** : Modèle de responsabilité partagée
4. **Coût-efficacité** : Paiement à l'usage
5. **Innovation** : Accès aux dernières technologies
6. **Intégration** : Écosystème complet d'outils DevOps

---

## 2. Architecture et Concepts Fondamentaux

### Infrastructure Globale AWS

#### Régions (Regions)
- **Définition** : Zones géographiques contenant plusieurs centres de données
- **Caractéristiques** :
  - Isolées géographiquement
  - Connectées par réseau privé haute performance
  - Chaque région a minimum 3 AZ
- **Critères de choix** :
  - Latence
  - Coût
  - Conformité réglementaire
  - Disponibilité des services

#### Zones de Disponibilité (Availability Zones - AZ)
- **Définition** : Centres de données isolés dans une région
- **Caractéristiques** :
  - Isolés des pannes
  - Connectés par réseau rapide
  - Permettent la haute disponibilité

#### Points de Présence (Edge Locations)
- **Utilisation** : CloudFront (CDN)
- **Avantages** : Réduction de la latence
- **Répartition** : Plus nombreux que les régions

### Architecture Well-Architected

#### 1. Pilier Fiabilité (Reliability)
- **Objectifs** :
  - Récupération automatique des pannes
  - Procédures de récupération testées
  - Mise à l'échelle horizontale
- **Pratiques** :
  - Déploiement multi-AZ
  - Sauvegarde automatique
  - Test de récupération

#### 2. Pilier Sécurité (Security)
- **Objectifs** :
  - Protection des données
  - Contrôle d'accès
  - Détection des incidents
- **Pratiques** :
  - Chiffrement en transit et au repos
  - Principe du moindre privilège
  - Audit et monitoring

#### 3. Pilier Performance (Performance Efficiency)
- **Objectifs** :
  - Utilisation efficace des ressources
  - Adaptation aux besoins
  - Évaluation continue
- **Pratiques** :
  - Choix adapté des services
  - Monitoring des performances
  - Optimisation continue

#### 4. Pilier Coût (Cost Optimization)
- **Objectifs** :
  - Éviter les coûts inutiles
  - Comprendre les dépenses
  - Optimiser les ressources
- **Pratiques** :
  - Dimensionnement approprié
  - Utilisation des instances réservées
  - Monitoring des coûts

#### 5. Pilier Durabilité (Sustainability)
- **Objectifs** :
  - Réduire l'impact environnemental
  - Optimiser l'utilisation des ressources
- **Pratiques** :
  - Utilisation efficace des ressources
  - Réduction de l'empreinte carbone

### Modèle de Responsabilité Partagée

#### Responsabilité AWS (Sécurité "DU" Cloud)
- Infrastructure physique
- Hyperviseur
- Système d'exploitation des services gérés
- Mise à jour des services

#### Responsabilité Client (Sécurité "DANS" le Cloud)
- Données client
- Configuration des services
- Système d'exploitation des EC2
- Applications et identités

---

## 3. Identité et Gestion des Accès (IAM)

### Concepts Fondamentaux

#### Utilisateurs (Users)
- **Définition** : Identité représentant une personne ou une application
- **Caractéristiques** :
  - Nom d'utilisateur unique
  - Identifiants d'accès (clés API)
  - Mots de passe pour console
- **Bonnes pratiques** :
  - Un utilisateur par personne
  - Rotation régulière des clés
  - MFA obligatoire

#### Groupes (Groups)
- **Définition** : Collection d'utilisateurs
- **Avantages** :
  - Gestion simplifiée des permissions
  - Cohérence des accès
- **Exemple** :
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-bucket/*"
    }
  ]
}
```

#### Rôles (Roles)
- **Définition** : Identité avec permissions spécifiques
- **Utilisation** :
  - Services AWS
  - Applications
  - Accès temporaire
- **Avantages** :
  - Sécurité renforcée
  - Pas de clés long terme
  - Fédération d'identité

#### Politiques (Policies)
- **Définition** : Document JSON définissant les permissions
- **Types** :
  - Gérées par AWS
  - Gérées par le client
  - Inline

### Structure d'une Politique IAM

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowEC2Actions",
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeInstances",
        "ec2:StartInstances",
        "ec2:StopInstances"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "ec2:Region": "us-east-1"
        }
      }
    }
  ]
}
```

### Éléments d'une Politique

#### Effect
- **Allow** : Autorise l'action
- **Deny** : Interdit l'action (prioritaire)

#### Action
- Services et actions autorisées
- Wildcards supportés (*)
- Exemple : `"s3:GetObject"`

#### Resource
- Ressources concernées
- ARN (Amazon Resource Name)
- Exemple : `"arn:aws:s3:::my-bucket/*"`

#### Condition
- Critères additionnels
- Variables de contexte
- Opérateurs de comparaison

### Bonnes Pratiques IAM

1. **Principe du Moindre Privilège**
   - Accorder uniquement les permissions nécessaires
   - Révision régulière des permissions

2. **Utilisation des Rôles**
   - Préférer les rôles aux utilisateurs pour les services
   - Rotation automatique des credentials

3. **Multi-Factor Authentication (MFA)**
   - Obligatoire pour les comptes privilégiés
   - Utilisation de tokens matériels ou virtuels

4. **Gestion des Clés d'Accès**
   - Rotation régulière
   - Stockage sécurisé
   - Audit des utilisations

5. **Monitoring et Audit**
   - CloudTrail pour l'audit
   - CloudWatch pour le monitoring
   - Alertes sur activités suspectes

---

## 4. Services de Calcul

### Amazon EC2 (Elastic Compute Cloud)

#### Concepts Fondamentaux

##### Instances
- **Définition** : Serveurs virtuels dans le cloud
- **Caractéristiques** :
  - Configurations variées (CPU, RAM, stockage)
  - Systèmes d'exploitation multiples
  - Mise à l'échelle flexible

##### Types d'Instances
1. **General Purpose** (T4g, M6i, M6a)
   - Équilibre CPU/RAM
   - Applications web, microservices

2. **Compute Optimized** (C6i, C6a)
   - CPU haute performance
   - Calcul intensif, gaming

3. **Memory Optimized** (R6i, X2gd)
   - RAM importante
   - Bases de données, cache

4. **Storage Optimized** (I4i, D3)
   - Stockage haute performance
   - Data warehousing, systèmes distribués

5. **Accelerated Computing** (P4, G5)
   - GPU/FPGA
   - Machine learning, HPC

##### Amazon Machine Images (AMI)
- **Définition** : Template pour créer des instances
- **Contenu** :
  - Système d'exploitation
  - Applications
  - Configuration

##### Security Groups
- **Définition** : Firewall virtuel au niveau instance
- **Règles** :
  - Inbound et outbound
  - Ports et protocoles
  - Sources/destinations

##### User Data
- **Définition** : Scripts exécutés au démarrage
- **Utilisation** :
  - Configuration automatique
  - Installation de logiciels
  - Démarrage d'applications

#### Exemple de Lancement d'Instance

```bash
# Lancement d'une instance EC2
aws ec2 run-instances \
  --image-id ami-0abcdef1234567890 \
  --instance-type t3.micro \
  --key-name my-key-pair \
  --security-group-ids sg-903004f8 \
  --subnet-id subnet-6e7f829e \
  --user-data file://user-data.sh
```

### Auto Scaling

#### Concepts
- **Auto Scaling Group** : Groupe d'instances gérées ensemble
- **Launch Template** : Configuration d'instance
- **Scaling Policies** : Règles de mise à l'échelle

#### Types de Scaling
1. **Manual Scaling** : Ajustement manuel
2. **Scheduled Scaling** : Planification
3. **Dynamic Scaling** : Basé sur les métriques
4. **Predictive Scaling** : Prédiction ML

#### Configuration Auto Scaling

```json
{
  "AutoScalingGroupName": "my-asg",
  "LaunchTemplate": {
    "LaunchTemplateId": "lt-1234567890abcdef0",
    "Version": "$Latest"
  },
  "MinSize": 1,
  "MaxSize": 10,
  "DesiredCapacity": 3,
  "VPCZoneIdentifier": [
    "subnet-12345",
    "subnet-67890"
  ],
  "HealthCheckType": "ELB",
  "HealthCheckGracePeriod": 300
}
```

### Elastic Load Balancing (ELB)

#### Types de Load Balancers

1. **Application Load Balancer (ALB)**
   - Layer 7 (HTTP/HTTPS)
   - Routing avancé
   - Support des conteneurs

2. **Network Load Balancer (NLB)**
   - Layer 4 (TCP/UDP)
   - Très haute performance
   - IP statiques

3. **Gateway Load Balancer (GWLB)**
   - Layer 3 (IP)
   - Appliances réseau
   - Inspection du trafic

#### Configuration ALB

```yaml
# Exemple avec Terraform
resource "aws_lb" "app_lb" {
  name               = "app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "app_tg" {
  name     = "app-targets"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/health"
  }
}
```

### AWS Lambda

#### Concepts Fondamentaux
- **Fonction** : Code exécuté en réponse à des événements
- **Runtime** : Environnement d'exécution
- **Handler** : Point d'entrée de la fonction
- **Event** : Déclencheur de la fonction

#### Exemple de Fonction Lambda

```python
import json
import boto3

def lambda_handler(event, context):
    # Traitement de l'événement
    s3_client = boto3.client('s3')
    
    # Exemple : traitement d'un fichier S3
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    
    # Logique métier
    result = process_file(bucket, key)
    
    return {
        'statusCode': 200,
        'body': json.dumps(result)
    }

def process_file(bucket, key):
    # Logique de traitement
    return f"Processed {key} from {bucket}"
```

#### Déclencheurs (Triggers)
- **API Gateway** : Requêtes HTTP
- **S3** : Événements de stockage
- **DynamoDB** : Modifications de données
- **CloudWatch** : Événements planifiés
- **SQS** : Messages en file d'attente

---

## 5. Services de Stockage

### Amazon S3 (Simple Storage Service)

#### Concepts Fondamentaux

##### Buckets
- **Définition** : Conteneurs pour objets
- **Caractéristiques** :
  - Nom globalement unique
  - Région spécifique
  - Contrôle d'accès

##### Objets
- **Définition** : Fichiers stockés dans S3
- **Composants** :
  - Clé (nom)
  - Valeur (données)
  - Métadonnées
  - Version

##### Storage Classes
1. **Standard** : Accès fréquent
2. **Standard-IA** : Accès peu fréquent
3. **One Zone-IA** : Accès peu fréquent, une AZ
4. **Glacier Instant Retrieval** : Archive, accès immédiat
5. **Glacier Flexible Retrieval** : Archive, accès en minutes/heures
6. **Glacier Deep Archive** : Archive long terme
7. **Intelligent Tiering** : Optimisation automatique

#### Gestion du Cycle de Vie

```json
{
  "Rules": [
    {
      "Id": "lifecycle-rule",
      "Status": "Enabled",
      "Filter": {
        "Prefix": "logs/"
      },
      "Transitions": [
        {
          "Days": 30,
          "StorageClass": "STANDARD_IA"
        },
        {
          "Days": 90,
          "StorageClass": "GLACIER"
        },
        {
          "Days": 365,
          "StorageClass": "DEEP_ARCHIVE"
        }
      ],
      "Expiration": {
        "Days": 2555
      }
    }
  ]
}
```

#### Sécurité S3

##### Bucket Policies
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-public-bucket/*"
    }
  ]
}
```

##### Access Control Lists (ACL)
- Contrôle d'accès au niveau objet
- Permissions prédéfinies
- Utilisation recommandée limitée

##### Chiffrement
1. **SSE-S3** : Clés gérées par S3
2. **SSE-KMS** : Clés gérées par KMS
3. **SSE-C** : Clés fournies par le client
4. **Client-side** : Chiffrement côté client

### Amazon EBS (Elastic Block Store)

#### Types de Volumes

1. **gp3** : SSD general purpose (nouvelle génération)
   - Performance configurée indépendamment
   - Rapport coût/performance optimal

2. **gp2** : SSD general purpose
   - Performance basée sur la taille
   - IOPS burstable

3. **io2** : SSD provisioned IOPS
   - Haute performance
   - Durabilité 99.999%

4. **sc1** : HDD cold storage
   - Accès peu fréquent
   - Coût optimisé

5. **st1** : HDD throughput optimized
   - Workloads séquentiels
   - Big data, data warehouse

#### Snapshots EBS
- **Définition** : Sauvegarde point-in-time
- **Caractéristiques** :
  - Stockage incrémental
  - Disponibilité inter-région
  - Restauration rapide

#### Exemple de Création

```bash
# Créer un volume EBS
aws ec2 create-volume \
  --size 100 \
  --volume-type gp3 \
  --availability-zone us-east-1a \
  --iops 3000 \
  --throughput 125

# Attacher à une instance
aws ec2 attach-volume \
  --volume-id vol-1234567890abcdef0 \
  --instance-id i-1234567890abcdef0 \
  --device /dev/sdf
```

### Amazon EFS (Elastic File System)

#### Caractéristiques
- **Système de fichiers** : POSIX-compliant
- **Accès concurrent** : Milliers d'instances
- **Élasticité** : Croissance automatique
- **Performance** : General Purpose ou Max I/O

#### Utilisation DevOps
- Partage de code et configurations
- Logs centralisés
- Stockage partagé pour conteneurs

---

## 6. Services de Réseau

### Amazon VPC (Virtual Private Cloud)

#### Concepts Fondamentaux

##### VPC
- **Définition** : Réseau virtuel isolé
- **Caractéristiques** :
  - Bloc CIDR personnalisé
  - Isolement logique
  - Contrôle total du réseau

##### Subnets
- **Définition** : Segments du VPC
- **Types** :
  - Public : Accès Internet via IGW
  - Private : Pas d'accès Internet direct
  - Database : Isolation supplémentaire

##### Internet Gateway (IGW)
- **Fonction** : Accès Internet pour VPC
- **Caractéristiques** :
  - Redondant et haute disponibilité
  - Un par VPC
  - Routage automatique

##### NAT Gateway/Instance
- **Fonction** : Internet sortant pour subnets privés
- **NAT Gateway** : Service géré
- **NAT Instance** : Instance EC2 configurée

#### Architecture VPC Typique

```
VPC (10.0.0.0/16)
├── Public Subnet 1 (10.0.1.0/24) - AZ-1a
├── Public Subnet 2 (10.0.2.0/24) - AZ-1b
├── Private Subnet 1 (10.0.11.0/24) - AZ-1a
├── Private Subnet 2 (10.0.12.0/24) - AZ-1b
├── Database Subnet 1 (10.0.21.0/24) - AZ-1a
└── Database Subnet 2 (10.0.22.0/24) - AZ-1b
```

#### Tables de Routage

```
# Public Route Table
Destination     Target
10.0.0.0/16     Local
0.0.0.0/0       igw-12345

# Private Route Table
Destination     Target
10.0.0.0/16     Local
0.0.0.0/0       nat-12345
```

### Security Groups vs NACLs

#### Security Groups
- **Niveau** : Instance
- **État** : Stateful
- **Règles** : Allow uniquement
- **Évaluation** : Toutes les règles

#### Network ACLs
- **Niveau** : Subnet
- **État** : Stateless
- **Règles** : Allow et Deny
- **Évaluation** : Ordre numérique

### VPC Endpoints

#### Interface Endpoints
- **Fonction** : Accès privé aux services AWS
- **Implémentation** : ENI avec IP privée
- **Coût** : Par heure et par GB

#### Gateway Endpoints
- **Services** : S3 et DynamoDB
- **Implémentation** : Route dans table de routage
- **Coût** : Gratuit

### AWS Direct Connect

#### Concepts
- **Connexion dédiée** : Liaison privée vers AWS
- **Avantages** :
  - Bande passante prédictible
  - Latence réduite
  - Coûts de transfert réduits

#### Virtual Interfaces (VIF)
- **Public VIF** : Accès services publics AWS
- **Private VIF** : Accès VPC via VGW
- **Transit VIF** : Accès multiple VPC via TGW

---

## 7. Base de Données

### Amazon RDS (Relational Database Service)

#### Moteurs Supportés
1. **MySQL** : Open source populaire
2. **PostgreSQL** : Avancé, extensible
3. **MariaDB** : Fork de MySQL
4. **Oracle** : Entreprise, features avancées
5. **SQL Server** : Microsoft, intégration Windows
6. **Amazon Aurora** : Cloud-native, haute performance

#### Fonctionnalités Clés

##### Multi-AZ
- **Fonction** : Haute disponibilité
- **Mécanisme** : Réplication synchrone
- **Failover** : Automatique en cas de panne

##### Read Replicas
- **Fonction** : Amélioration des performances de lecture
- **Mécanisme** : Réplication asynchrone
- **Utilisation** : Scaling horizontal

##### Automated Backups
- **Rétention** : 0-35 jours
- **Point-in-time recovery** : Jusqu'à la seconde
- **Snapshots** : Manuels, persistants

#### Exemple de Configuration

```yaml
# Terraform RDS
resource "aws_db_instance" "main" {
  identifier     = "main-database"
  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  
  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type         = "gp2"
  storage_encrypted    = true
  
  db_name  = "myapp"
  username = "admin"
  password = var.db_password
  
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  
  backup_retention_period = 7
  backup_window          = "03:00-04:00"
  maintenance_window     = "sun:04:00-sun:05:00"
  
  multi_az               = true
  publicly_accessible    = false
  
  tags = {
    Name = "Main Database"
  }
}
```

### Amazon Aurora

#### Avantages
- **Performance** : 5x MySQL, 3x PostgreSQL
- **Stockage** : Auto-scaling jusqu'à 128 TB
- **Réplication** : Jusqu'à 15 read replicas
- **Disponibilité** : 99.99% SLA

#### Architecture
- **Storage** : Distribué sur 3 AZ
- **Compute** : Instances séparées
- **Endpoints** : Writer et Reader

### Amazon DynamoDB

#### Caractéristiques
- **NoSQL** : Base de données clé-valeur/document
- **Serverless** : Pas de serveurs à gérer
- **Performance** : Latence single-digit milliseconde
- **Scalabilité** : Illimitée

#### Concepts Clés

##### Tables
- **Partition Key** : Clé de hachage
- **Sort Key** : Clé de tri (optionnelle)
- **Composite Key** : Partition + Sort

##### Modes de Facturation
1. **On-Demand** : Paiement par requête
2. **Provisioned** : Capacité pré-allouée

##### Global Secondary Index (GSI)
- **Fonction** : Requêtes sur attributs non-clés
- **Limitation** : Éventuellement consistant

#### Exemple DynamoDB

```python
import boto3

# Client DynamoDB
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Users')

# Créer un item
table.put_item(
    Item={
        'user_id': '123',
        'name': 'John Doe',
        'email': 'john@example.com',
        'created_at': '2024-01-01T00:00:00Z'
    }
)

# Lire un item
response = table.get_item(
    Key={'user_id': '123'}
)
user = response['Item']

# Query avec GSI
response = table.query(
    IndexName='email-index',
    KeyConditionExpression='email = :email',
    ExpressionAttributeValues={':email': 'john@example.com'}
)
```

### Amazon ElastiCache

#### Moteurs
1. **Redis** : Structure de données avancée
2. **Memcached** : Cache simple, multi-thread

#### Utilisation DevOps
- **Session Store** : Stockage de sessions web
- **Cache** : Réduction de charge base de données
- **Pub/Sub** : Messagerie temps réel

---

## 8. Services DevOps et CI/CD

### AWS CodeCommit

#### Caractéristiques
- **Git** : Repositories Git privés
- **Sécurité** : Chiffrement en transit/repos
- **Intégration** : IAM, autres services AWS

#### Configuration

```bash
# Configuration Git
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

# Clone repository
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/my-repo
```

### AWS CodeBuild

#### Concepts
- **Build Projects** : Configuration de build
- **Build Environments** : Environnements d'exécution
- **Build Specifications** : Instructions de build

#### buildspec.yml

```yaml
version: 0.2

phases:
  install:
    runtime-versions:
      nodejs: 14
    commands:
      - echo Install phase started
      - npm install
  
  pre_build:
    commands:
      - echo Pre-build phase started
      - npm run lint
      - npm run test
  
  build:
    commands:
      - echo Build phase started
      - npm run build
      - docker build -t my-app .
  
  post_build:
    commands:
      - echo Post-build phase started
      - docker tag my-app:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/my-app:latest
      - docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/my-app:latest

artifacts:
  files:
    - '**/*'
  base-directory: build
```

### AWS CodeDeploy

#### Types de Déploiement
1. **EC2/On-Premises** : Déploiement sur instances
2. **Lambda** : Déploiement de functions
3. **ECS** : Déploiement de conteneurs

#### Stratégies de Déploiement

##### Blue/Green
- **Principe** : Deux environnements identiques
- **Avantages** : Rollback instantané, zéro downtime
- **Inconvénients** : Coût double

##### Rolling
- **Principe** : Mise à jour progressive
- **Avantages** : Utilisation optimale des ressources
- **Inconvénients** : Rollback complexe

##### Canary
- **Principe** : Déploiement partiel puis complet
- **Avantages** : Réduction des risques
- **Inconvénients** : Complexité accrue

#### Configuration appspec.yml

```yaml
# Pour EC2
version: 0.0
os: linux
files:
  - source: /
    destination: /var/www/html/
hooks:
  BeforeInstall:
    - location: scripts/install_dependencies.sh
      timeout: 300
      runas: root
  ApplicationStart:
    - location: scripts/start_server.sh
      timeout: 300
      runas: root
  ApplicationStop:
    - location: scripts/stop_server.sh
      timeout: 300
      runas: root
```

### AWS CodePipeline

#### Concepts
- **Pipeline** : Workflow de déploiement
- **Stages** : Étapes séquentielles
- **Actions** : Tâches dans les stages

#### Pipeline Structure

```json
{
  "pipeline": {
    "name": "MyPipeline",
    "stages": [
      {
        "name": "Source",
        "actions": [
          {
            "name": "SourceAction",
            "actionTypeId": {
              "category": "Source",
              "owner": "AWS",
              "provider": "CodeCommit",
              "version": "1"
            },
            "configuration": {
              "RepositoryName": "my-repo",
              "BranchName": "main"
            },
            "outputArtifacts": [
              {
                "name": "SourceOutput"
              }
            ]
          }
        ]
      },
      {
        "name": "Build",
        "actions": [
          {
            "name": "BuildAction",
            "actionTypeId": {
              "category": "Build",
              "owner": "AWS",
              "provider": "CodeBuild",
              "version": "1"
            },
            "configuration": {
              "ProjectName": "my-build-project"
            },
            "inputArtifacts": [
              {
                "name": "SourceOutput"
              }
            ],
            "outputArtifacts": [
              {
                "name": "BuildOutput"
              }
            ]
          }
        ]
      },
      {
        "name": "Deploy",
        "actions": [
          {
            "name": "DeployAction",
            "actionTypeId": {
              "category": "Deploy",
              "owner": "AWS",
              "provider": "CodeDeploy",
              "version": "1"
            },
            "configuration": {
              "ApplicationName": "my-app",
              "DeploymentGroupName": "my-deployment-group"
            },
            "inputArtifacts": [
              {
                "name": "BuildOutput"
              }
            ]
          }
        ]
      }
    ]
  }
}
```

### AWS CodeStar

#### Fonctionnalités
- **Templates** : Projets pré-configurés
- **Intégration** : Tous les services Code*
- **Dashboard** : Vue d'ensemble du projet

### AWS CodeArtifact

#### Utilisation
- **Repository** : Stockage d'artefacts
- **Packages** : NPM, PyPI, Maven, NuGet
- **Sécurité** : Contrôle d'accès granulaire

---

## 9. Monitoring et Observabilité

### Amazon CloudWatch

#### Métriques

##### Métriques par Défaut
- **EC2** : CPU, réseau, disque
- **RDS** : Connexions, IOPS, latence
- **Lambda** : Invocations, durée, erreurs

##### Métriques Personnalisées
```python
import boto3
import time

cloudwatch = boto3.client('cloudwatch')

# Envoyer une métrique personnalisée
cloudwatch.put_metric_data(
    Namespace='MyApp/Performance',
    MetricData=[
        {
            'MetricName': 'PageLoadTime',
            'Value': 1.23,
            'Unit': 'Seconds',
            'Timestamp': time.time(),
            'Dimensions': [
                {
                    'Name': 'Environment',
                    'Value': 'Production'
                }
            ]
        }
    ]
)
```

#### Logs

##### Log Groups et Log Streams
- **Log Group** : Collection de logs similaires
- **Log Stream** : Séquence d'événements
- **Retention** : Configurable par Log Group

##### CloudWatch Logs Insights
```sql
-- Requête d'exemple
fields @timestamp, @message
| filter @message like /ERROR/
| stats count() by bin(5m)
| sort @timestamp desc
```

#### Alarmes

##### Types d'Alarmes
1. **Metric Alarms** : Basées sur métriques
2. **Composite Alarms** : Combinaison d'alarmes
3. **Anomaly Detection** : Détection d'anomalies ML

##### Configuration d'Alarme
```yaml
# CloudFormation
Resources:
  HighCPUAlarm:
    Type: AWS::CloudWatch::Alarm
    Properties:
      AlarmName: HighCPUUtilization
      AlarmDescription: Alarm when CPU exceeds 80%
      MetricName: CPUUtilization
      Namespace: AWS/EC2
      Statistic: Average
      Period: 300
      EvaluationPeriods: 2
      Threshold: 80
      ComparisonOperator: GreaterThanThreshold
      Dimensions:
        - Name: InstanceId
          Value: !Ref EC2Instance
      AlarmActions:
        - !Ref SNSTopic
```

### AWS X-Ray

#### Concepts
- **Traces** : Requêtes de bout en bout
- **Segments** : Composants d'une trace
- **Subsegments** : Sous-composants
- **Annotations** : Métadonnées indexées
- **Metadata** : Informations non-indexées

#### Instrumentation

##### Python
```python
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch_all

# Patch des librairies
patch_all()

@xray_recorder.capture('my_function')
def my_function():
    # Code de la fonction
    subsegment = xray_recorder.begin_subsegment('external_call')
    try:
        # Appel externe
        result = external_api_call()
        subsegment.put_annotation('success', True)
        return result
    except Exception as e:
        subsegment.put_annotation('success', False)
        subsegment.put_metadata('error', str(e))
        raise
    finally:
        xray_recorder.end_subsegment()
```

### AWS CloudTrail

#### Fonctionnalités
- **API Logging** : Enregistrement des appels API
- **Data Events** : Événements de données (S3, Lambda)
- **Insight Events** : Détection d'activité inhabituelle

#### Configuration
```json
{
  "TrailName": "MyCloudTrail",
  "S3BucketName": "my-cloudtrail-bucket",
  "IncludeGlobalServiceEvents": true,
  "IsMultiRegionTrail": true,
  "EnableLogFileValidation": true,
  "EventSelectors": [
    {
      "ReadWriteType": "All",
      "IncludeManagementEvents": true,
      "DataResources": [
        {
          "Type": "AWS::S3::Object",
          "Values": ["arn:aws:s3:::my-bucket/*"]
        }
      ]
    }
  ]
}
```

### Amazon OpenSearch Service

#### Utilisation DevOps
- **Log Analytics** : Analyse des logs d'application
- **Monitoring** : Visualisation des métriques
- **Alerting** : Notifications sur anomalies

#### Configuration Elasticsearch

```python
from elasticsearch import Elasticsearch

# Connexion
es = Elasticsearch(
    ['https://search-mydomain.us-east-1.es.amazonaws.com'],
    use_ssl=True,
    verify_certs=True,
    connection_class=RequestsHttpConnection
)

# Index des logs
log_entry = {
    'timestamp': '2024-01-01T12:00:00Z',
    'level': 'ERROR',
    'message': 'Database connection failed',
    'service': 'user-service',
    'host': 'app-server-01'
}

es.index(index='application-logs', body=log_entry)
```

---

## 10. Sécurité AWS

### AWS Security Hub

#### Fonctionnalités
- **Centralisation** : Vue unique de la sécurité
- **Standards** : AWS Foundational, CIS, PCI DSS
- **Findings** : Résultats d'évaluation sécurité

### AWS GuardDuty

#### Détection de Menaces
- **Machine Learning** : Détection d'anomalies
- **Threat Intelligence** : Feeds de menaces
- **DNS Logs** : Analyse du trafic DNS

#### Types de Détection
1. **Reconnaissance** : Scanning, probing
2. **Instance Compromise** : Malware, backdoors
3. **Account Compromise** : Credentials compromis

### AWS Inspector

#### Évaluation de Sécurité
- **EC2** : Vulnérabilités OS et applications
- **Container Images** : Scan d'images de conteneurs
- **Lambda** : Vulnérabilités code et dépendances

### AWS WAF (Web Application Firewall)

#### Règles de Protection
1. **IP Whitelisting/Blacklisting**
2. **Geo-blocking**
3. **Rate Limiting**
4. **SQL Injection Protection**
5. **XSS Protection**

#### Configuration WAF
```json
{
  "Name": "MyWebACL",
  "Rules": [
    {
      "Name": "AWSManagedRulesCommonRuleSet",
      "Priority": 1,
      "Statement": {
        "ManagedRuleGroupStatement": {
          "VendorName": "AWS",
          "Name": "AWSManagedRulesCommonRuleSet"
        }
      },
      "Action": {
        "Block": {}
      },
      "VisibilityConfig": {
        "SampledRequestsEnabled": true,
        "CloudWatchMetricsEnabled": true,
        "MetricName": "CommonRuleSetMetric"
      }
    }
  ]
}
```

### AWS KMS (Key Management Service)

#### Concepts
- **Customer Master Keys (CMK)** : Clés de chiffrement
- **Data Keys** : Clés pour chiffrement données
- **Key Policies** : Contrôle d'accès aux clés

#### Utilisation KMS
```python
import boto3

kms = boto3.client('kms')

# Chiffrer des données
response = kms.encrypt(
    KeyId='arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012',
    Plaintext='Secret data'
)
encrypted_data = response['CiphertextBlob']

# Déchiffrer des données
response = kms.decrypt(
    CiphertextBlob=encrypted_data
)
decrypted_data = response['Plaintext']
```

### AWS Secrets Manager

#### Fonctionnalités
- **Stockage sécurisé** : Mots de passe, clés API
- **Rotation automatique** : Rotation programmée
- **Intégration** : RDS, Redshift, DocumentDB

#### Utilisation
```python
import boto3

secrets_client = boto3.client('secretsmanager')

# Récupérer un secret
response = secrets_client.get_secret_value(
    SecretId='prod/myapp/database'
)
secret = json.loads(response['SecretString'])

# Utiliser les credentials
db_username = secret['username']
db_password = secret['password']
```

---

## 11. Infrastructure as Code (IaC)

### AWS CloudFormation

#### Concepts
- **Templates** : Fichiers JSON/YAML
- **Stacks** : Déploiement de ressources
- **Change Sets** : Prévisualisation des changements

#### Exemple de Template

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: 'Web Application Stack'

Parameters:
  InstanceType:
    Type: String
    Default: t3.micro
    AllowedValues:
      - t3.micro
      - t3.small
      - t3.medium
    Description: EC2 instance type

  KeyName:
    Type: AWS::EC2::KeyPair::KeyName
    Description: EC2 Key Pair for SSH access

Resources:
  VPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: 10.0.0.0/16
      EnableDnsHostnames: true
      EnableDnsSupport: true
      Tags:
        - Key: Name
          Value: MyVPC

  InternetGateway:
    Type: AWS::EC2::InternetGateway
    Properties:
      Tags:
        - Key: Name
          Value: MyIGW

  AttachGateway:
    Type: AWS::EC2::VPCGatewayAttachment
    Properties:
      VpcId: !Ref VPC
      InternetGatewayId: !Ref InternetGateway

  PublicSubnet:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      CidrBlock: 10.0.1.0/24
      AvailabilityZone: !Select [0, !GetAZs '']
      MapPublicIpOnLaunch: true
      Tags:
        - Key: Name
          Value: Public Subnet

  RouteTable:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: Public Route Table

  PublicRoute:
    Type: AWS::EC2::Route
    DependsOn: AttachGateway
    Properties:
      RouteTableId: !Ref RouteTable
      DestinationCidrBlock: 0.0.0.0/0
      GatewayId: !Ref InternetGateway

  SubnetRouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PublicSubnet
      RouteTableId: !Ref RouteTable

  SecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Security group for web server
      VpcId: !Ref VPC
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 80
          ToPort: 80
          CidrIp: 0.0.0.0/0
        - IpProtocol: tcp
          FromPort: 443
          ToPort: 443
          CidrIp: 0.0.0.0/0
        - IpProtocol: tcp
          FromPort: 22
          ToPort: 22
          CidrIp: 0.0.0.0/0

  WebServer:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: ami-0abcdef1234567890
      InstanceType: !Ref InstanceType
      KeyName: !Ref KeyName
      SubnetId: !Ref PublicSubnet
      SecurityGroupIds:
        - !Ref SecurityGroup
      UserData:
        Fn::Base64: !Sub |
          #!/bin/bash
          yum update -y
          yum install -y httpd
          systemctl start httpd
          systemctl enable httpd
          echo "<h1>Hello from ${AWS::Region}</h1>" > /var/www/html/index.html

Outputs:
  WebServerPublicIP:
    Description: Public IP address of the web server
    Value: !GetAtt WebServer.PublicIp
    Export:
      Name: !Sub ${AWS::StackName}-WebServerIP

  WebServerURL:
    Description: URL of the web server
    Value: !Sub http://${WebServer.PublicIp}
```

#### Fonctions Intrinsèques

```yaml
# Référence à une ressource
VpcId: !Ref VPC

# Obtenir un attribut
PublicIp: !GetAtt WebServer.PublicIp

# Joindre des strings
URL: !Sub http://${WebServer.PublicIp}:8080

# Conditions
Conditions:
  CreateProdResources: !Equals [!Ref Environment, production]

# Sélectionner dans une liste
AvailabilityZone: !Select [0, !GetAZs '']
```

### AWS CDK (Cloud Development Kit)

#### Avantages
- **Langages familiers** : Python, TypeScript, Java, C#
- **Réutilisabilité** : Composants et constructs
- **Type Safety** : Vérification à la compilation

#### Exemple CDK Python

```python
from aws_cdk import (
    aws_ec2 as ec2,
    aws_ecs as ecs,
    aws_ecs_patterns as ecs_patterns,
    aws_applicationautoscaling as appscaling,
    core
)

class WebAppStack(core.Stack):
    def __init__(self, scope: core.Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        # VPC
        vpc = ec2.Vpc(
            self, "MyVpc",
            max_azs=2,
            subnet_configuration=[
                ec2.SubnetConfiguration(
                    name="Public",
                    subnet_type=ec2.SubnetType.PUBLIC,
                    cidr_mask=24
                ),
                ec2.SubnetConfiguration(
                    name="Private",
                    subnet_type=ec2.SubnetType.PRIVATE_WITH_NAT,
                    cidr_mask=24
                )
            ]
        )

        # ECS Cluster
        cluster = ecs.Cluster(
            self, "MyCluster",
            vpc=vpc
        )

        # Fargate Service
        fargate_service = ecs_patterns.ApplicationLoadBalancedFargateService(
            self, "MyFargateService",
            cluster=cluster,
            cpu=256,
            memory_limit_mib=512,
            task_image_options=ecs_patterns.ApplicationLoadBalancedTaskImageOptions(
                image=ecs.ContainerImage.from_registry("nginx:latest"),
                container_port=80
            ),
            public_load_balancer=True,
            desired_count=2
        )

        # Auto Scaling
        scaling = fargate_service.service.auto_scale_task_count(
            max_capacity=10,
            min_capacity=2
        )

        scaling.scale_on_cpu_utilization(
            "CpuScaling",
            target_utilization_percent=70,
            scale_in_cooldown=core.Duration.seconds(60),
            scale_out_cooldown=core.Duration.seconds(60)
        )

        # Output
        core.CfnOutput(
            self, "LoadBalancerDNS",
            value=fargate_service.load_balancer.load_balancer_dns_name
        )

app = core.App()
WebAppStack(app, "WebAppStack")
app.synth()
```

### Terraform avec AWS

#### Provider Configuration

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "infrastructure/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}
```

#### Exemple d'Infrastructure

```hcl
# Variables
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}

# Subnets
resource "aws_subnet" "public" {
  count = 2

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.${count.index + 1}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_subnet" "private" {
  count = 2

  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index + 10}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name        = "${var.environment}-private-subnet-${count.index + 1}"
    Environment = var.environment
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.environment}-igw"
    Environment = var.environment
  }
}

# NAT Gateway
resource "aws_eip" "nat" {
  count = 2

  domain = "vpc"
  depends_on = [aws_internet_gateway.main]

  tags = {
    Name        = "${var.environment}-nat-eip-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_nat_gateway" "main" {
  count = 2

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name        = "${var.environment}-nat-${count.index + 1}"
    Environment = var.environment
  }
}

# Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "${var.environment}-public-rt"
    Environment = var.environment
  }
}

resource "aws_route_table" "private" {
  count = 2

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[count.index].id
  }

  tags = {
    Name        = "${var.environment}-private-rt-${count.index + 1}"
    Environment = var.environment
  }
}

# Route Table Associations
resource "aws_route_table_association" "public" {
  count = 2

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = 2

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

# Data Sources
data "aws_availability_zones" "available" {
  state = "available"
}

# Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}
```

---

## 12. Conteneurisation et Orchestration

### Amazon ECS (Elastic Container Service)

#### Concepts Clés

##### Task Definition
```json
{
  "family": "web-app",
  "networkMode": "awsvpc",
  "requiresCompatibilities": ["FARGATE"],
  "cpu": "256",
  "memory": "512",
  "executionRoleArn": "arn:aws:iam::123456789012:role/ecsTaskExecutionRole",
  "taskRoleArn": "arn:aws:iam::123456789012:role/ecsTaskRole",
  "containerDefinitions": [
    {
      "name": "web-container",
      "image": "nginx:latest",
      "portMappings": [
        {
          "containerPort": 80,
          "protocol": "tcp"
        }
      ],
      "essential": true,
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/web-app",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "ecs"
        }
      },
      "environment": [
        {
          "name": "ENV",
          "value": "production"
        }
      ],
      "secrets": [
        {
          "name": "DB_PASSWORD",
          "valueFrom": "arn:aws:secretsmanager:us-east-1:123456789012:secret:db-password"
        }
      ]
    }
  ]
}
```

##### Service
```json
{
  "serviceName": "web-service",
  "cluster": "my-cluster",
  "taskDefinition": "web-app:1",
  "desiredCount": 3,
  "launchType": "FARGATE",
  "networkConfiguration": {
    "awsvpcConfiguration": {
      "subnets": [
        "subnet-12345678",
        "subnet-87654321"
      ],
      "securityGroups": [
        "sg-12345678"
      ],
      "assignPublicIp": "ENABLED"
    }
  },
  "loadBalancers": [
    {
      "targetGroupArn": "arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/my-targets/73e2d6bc24d8a067",
      "containerName": "web-container",
      "containerPort": 80
    }
  ]
}
```

#### Types de Lancement

##### EC2 Launch Type
- **Contrôle** : Gestion des instances EC2
- **Flexibilité** : Configuration personnalisée
- **Coût** : Potentiellement plus économique

##### Fargate Launch Type
- **Serverless** : Pas de gestion d'instances
- **Simplicité** : Déploiement simplifié
- **Coût** : Paiement par ressource utilisée

### Amazon EKS (Elastic Kubernetes Service)

#### Architecture
```
EKS Control Plane (AWS Managed)
├── API Server
├── etcd
├── Controller Manager
└── Scheduler

Worker Nodes (Customer Managed)
├── kubelet
├── kube-proxy
├── Container Runtime
└── AWS CNI Plugin
```

#### Cluster Configuration

```yaml
# eksctl cluster config
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: my-cluster
  region: us-east-1
  version: "1.24"

nodeGroups:
  - name: workers
    instanceType: t3.medium
    desiredCapacity: 3
    minSize: 1
    maxSize: 10
    volumeSize: 20
    ssh:
      publicKeyName: my-key-pair
    iam:
      attachPolicyARNs:
        - arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
        - arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
        - arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly

managedNodeGroups:
  - name: managed-workers
    instanceType: t3.medium
    desiredCapacity: 2
    minSize: 1
    maxSize: 5

fargateProfiles:
  - name: fp-default
    selectors:
      - namespace: default
      - namespace: kube-system

addons:
  - name: vpc-cni
  - name: coredns
  - name: kube-proxy
```

#### Application Deployment

```yaml
# Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web-app
  template:
    metadata:
      labels:
        app: web-app
    spec:
      containers:
      - name: web-container
        image: nginx:latest
        ports:
        - containerPort: 80
        env:
        - name: ENV
          value: "production"
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
          limits:
            cpu: 500m
            memory: 512Mi
        livenessProbe:
          httpGet:
            path: /health
            port: 80
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /ready
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 5

---
# Service
apiVersion: v1
kind: Service
metadata:
  name: web-service
  namespace: default
spec:
  selector:
    app: web-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
  type: LoadBalancer

---
# Ingress
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: web-ingress
  namespace: default
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
    al