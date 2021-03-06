% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/E4_EDA_Process.part4.BinMatchedEDA.R
\name{E4_EDA_Process.part4.BinMatchedEDA}
\alias{E4_EDA_Process.part4.BinMatchedEDA}
\title{Bin the EDA data matched to button presses}
\usage{
E4_EDA_Process.part4.BinMatchedEDA(participant_list,
  rdslocation.MatchedEDA, rdslocation.BinnedMatchedEDA, min.after,
  min.before, control = FALSE)
}
\arguments{
\item{participant_list}{list of participant numbers NOTE: This should match the names of the folders (e.g., participant 1001's data should be in a folder called "1001")}

\item{rdslocation.MatchedEDA}{folder location of the combined EDA file from step 3. (The file is called EDA_presses_COMBINED.RDS)}

\item{rdslocation.BinnedMatchedEDA}{location of folder where you want the binned data to be stored}

\item{min.after}{how many minutes after a button press do you want EDA data? Enter 0 if you do not want ANY data after (i.e., you're using only data pre-press). This should match what you entered in step 3!}

\item{min.before}{how many minutes before a button press do you want EDA data? Enter 0 if you do not want ANY data before (i.e., you're using only data post-press). This should match what you entered in step 3!}

\item{control}{does this dataset include control cases? This should match what you did in step 3.}
}
\description{
This function allows you to bin the data that has been matched to the button pressess (from step 3).
}
\examples{
E4_EDA_Process.part4.BinMatchedEDA(participant_list=c(1001:1002),
                                  rdslocation.MatchedEDA=paste(system.file(package="E4tools"),
                                  "/extdata/output/matched_EDA/",sep=""),
                                  rdslocation.BinnedMatchedEDA=
                                  paste(tempdir(),"/extdata/output/binned_matched_EDA/",sep=""),
                                  min.after = 20,min.before = 20,control=TRUE)
}
\keyword{EDA}
