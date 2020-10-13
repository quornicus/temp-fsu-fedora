# $Id: index.properties 6569 2008-02-08 15:16:13Z gertsp $

# Properties for the DemoOnSolr index

fgsindex.indexName					= FgsIndex

fgsindex.operationsImpl				= dk.defxws.fgssolrremote.OperationsImpl

fgsindex.defaultUpdateIndexDocXslt		= foxmlToSolr
fgsindex.defaultUpdateIndexResultXslt	= updateIndexToResultPage
fgsindex.defaultGfindObjectsResultXslt	= gfindObjectsToResultPage
fgsindex.defaultBrowseIndexResultXslt	= browseIndexToResultPage
fgsindex.defaultGetIndexInfoResultXslt	= copyXml

fgsindex.indexBase    = http://{{getv "/solr/endpoint"}}:8080/solr

# The directory must exist, it is used for browseIndex and gfindObjects.
fgsindex.indexDir				= NOT_USED

# the next two properties have their counterpart in the Solr config file schema.xml,
# make sure they match, else you get different search behaviour from the same query
# sent to Solr versus sent to GSearch.
fgsindex.analyzer				= org.apache.lucene.analysis.standard.StandardAnalyzer
fgsindex.defaultQueryFields		= dc.description dc.title
# This may not be needed for all versions of gsearch.
fgsindex.uriResolver = dk.defxws.fedoragsearch.server.URIResolverImpl
# for queries sent to Solr, sorting is determined in the Solr config files
# for queries sent to  GSearch, sortFields may be given as parameter to gfindObjects, or as config default.
###########

