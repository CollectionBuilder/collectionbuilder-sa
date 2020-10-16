# OAI-PMH static implementation

[Open Archives Initiative](http://www.openarchives.org/) develops a set of interoperability standards used in cultural heritage repositories to facilitate aggregation and harvesting of metadata.
[OAI-PMH](http://www.openarchives.org/OAI/openarchivesprotocol.html) is a standard built into most digital collection repository platforms that requires a server to process a specific set of requests and provide an XML response.
However, OAI-PMH also specifies a "static repository" implementation intended for smaller collections (less than 5000 records) without processing OAI-PMH requests. 

A "Static Repository" is an XML file following the spec describing the collection published at a persistent URL. 

The Static Repository is made available to harvesters via a single "Static Repository Gateway" which is a server which can respond to OAI-PMH requests, but uses the information in the "Static Repository" to answer.

## Static Repository File

- Specification for an OAI Static Repository and an OAI Static Repository Gateway, http://www.openarchives.org/OAI/2.0/guidelines-static-repository.htm
- Static Repository XML schema, http://www.openarchives.org/OAI/2.0/static-repository.xsd

Requirements: 

- UTF-8, mime of text/xml
- have "oai-identifier" following pattern `oai:domain-name:local-identifier`, e.g. `oai:foo.org:some-local-id-53`. In CB context, `oai:{{ site.url | remove: 'https://' }}:{{ site.baseurl | remove: '/' }}/{{ item.objectid }}`
- have dates with exactly `YYYY-MM-DD` (use `<oai:granularity>YYYY-MM-DD</oai:granularity>`)
- initiate intermediation with a Static Repository Gateway

In this project the "static repository" is `oai.xml` file in the root directory. 

The OAI XML uses basic Dublin Core metadata as a base for records as outlined in [oai_dc.xsd](http://www.openarchives.org/OAI/2.0/oai_dc.xsd) spec.
This allows fields: dc:title, dc:creator, dc:subject, dc:description, dc:publisher, dc:contributor, dc:date, dc:type, dc:format, dc:identifier, dc:source, dc:language, dc:relation, dc:coverage, dc:rights.
The oai.xml template will iterate over all items using the fields listed in site.config-metadata.dc_map. 
It will compare dc_map (which are give in format like `DCTERMS.title`) with the available oai_dc terms, e.g. if you have `DCTERMS.creator` in dc_map, it will fill in `<dc:creator>` in the XML. 

## Static Repository Gateway

The "static repository" must be intermediated by a Gateway that responds to OAI-PMH requests. 
It must be registered with only one Gateway.
Access to harvesting will be via the Gateway, following pattern 
`gateway-url/oai/static-repository-url`, 
e.g. `http://gateway.institution.org/oai/an.oai.org/ma/mini.xml`.

To set up a new "static repository", need to initiate by sending a request:
`<Static Repository Gateway URL>?initiate=<Static Repository URL>`, 
e.g. `http://gateway.institution.org/oai?initiate=http://an.oai.org/ma/mini.xml`

To stop using the Gateway send a termination request:
`<Static Repository Gateway URL>?terminate=<Static Repository URL>`

Example Gateway Container for a Static Repository Gateway:

```
<?xml version="1.0" encoding="UTF-8"?>
<gateway xmlns="http://www.openarchives.org/OAI/2.0/gateway/"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/gateway/
                      http://www.openarchives.org/OAI/2.0/gateway.xsd">
  <source>http://an.oai.org/ma/mini.xml</source>
  <gatewayDescription>http://www.openarchives.org/OAI/2.0/guidelines-static-repository.htm</gatewayDescription>
  <gatewayAdmin>pat@institution.org</gatewayAdmin>
  <gatewayURL>http://bar.edu/oai-gateway/2.0/</gatewayURL>
  <gatewayNotes>http://gateway.institution.org/oai/</gatewayNotes>
</gateway>
```
