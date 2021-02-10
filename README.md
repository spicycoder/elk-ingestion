# ELK Ingestion

Ingest AdventureWorksLT into ELK Stack

---

## Prepare SQL Server Database

Download AdventureWorksLT 2019 bak file from

<https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms>

Place it in `./sql-db/` directory

```sh
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=helloWorld18!' --name adventureworks -v ${PWD}/sql-db:/db -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest
```

> Connect to localhost with sa\helloWorld18! & restore bak file from /db/AdventureWorksLT2019.bak

---

## Prepare ELK

Get images (one time)

```sh
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.10.1
docker pull docker.elastic.co/logstash/logstash:7.10.1
docker pull docker.elastic.co/kibana/kibana:7.10.1
```

Launch Elastic Search & Kibana

```sh
docker-compose up -d
```

ElasticSearch: <http://localhost:9200/>
Kibana: <http://localhost:5601/>

---

## Ingestion

> [Download MSSQL JDBC Driver](https://docs.microsoft.com/en-us/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver15) (jar) & place it in `logstash-core\lib\jars` location

> Execute following command from Logstash location

- Products

```sh
./bin/logstash -f ./products.conf
```

- Customers

```sh
./bin/logstash -f ./customers.conf
```

> To verify, execute following from Kibana

```
GET products/_count
GET customers/_count
```

> To `search`, execute following from Kibana

```
POST products/_search
{
  "query": {
    "match": {
      "model": "bike"
    }
  }
}
```

---