get_the_silly_data_because_oh_my_god_im_losing_it <- function(search="Elephas maximus", returnlimit=50) {

}


ids <- entrez_search(db="nuccore", term="Elephas maximus", retmax=50)$ids
xml <- entrez_fetch(db="nuccore", id=ids, rettype="xml", parsed=TRUE)
xmlList <- xmlToList(xml)

locuses <- xpathSApply(xml, "//GBSeq_locus", xmlValue)
lengths <- xpathSApply(xml, "//GBSeq_length", xmlValue)
strandednesses <- xpathSApply(xml, "//GBSeq_strandedness", xmlValue)
moltypes <- xpathSApply(xml, "//GBSeq_moltype", xmlValue)
topologies <- xpathSApply(xml, "//GBSeq_topology", xmlValue)
divisions <- xpathSApply(xml, "//GBSeq_division", xmlValue)
update_dates <- xpathSApply(xml, "//GBSeq_update-date", xmlValue)
create_dates <- xpathSApply(xml, "//GBSeq_create-date", xmlValue)
definitions <- xpathSApply(xml, "//GBSeq_definition", xmlValue)
primary_accessions <- xpathSApply(xml, "//GBSeq_primary-accession", xmlValue)
accession_versions <- xpathSApply(xml, "//GBSeq_accession-version", xmlValue)
#Skip over other seqids
#projects <- xpathSApply(xml, "//GBSeq_project", xmlValue)

final <- data.frame(locuses, lengths, strandednesses, moltypes, topologies, divisions, update_dates, create_dates, definitions, primary_accessions, accession_versions)
