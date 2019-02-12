#' EDA Extra Processing: Get number of button presses per participant, per day from the combined "button_pressess.RDS" file
#'
#' This function allows you extract button pressess per participant, per day. It will output a data frame (not an RDS file) that you can use for analyses.
#' @param rdslocation.buttonpress location of folder where button press output is stored (the file is called "button_presses.RDS"). This should end in / .
#' @param ImputeNAs This will create NAs for any days between the first and last day of study data for each participant. If no data = no presses (which is likely the case, use the "ImputeZeros" option to make them zeros instead)
#' @param ImputeZeros Do you want to make the NAs for days without data zeros instead?
#' @return Dataframe with a three columns: ID, date, number of button pressess.
#' @export
#' @examples
#' \dontrun{E4.extras.ButtonPressessPerDay(rdslocation.buttonpress="/Users/documents/study/data/tags/",ImputeNAs=T,ImputeZeros=T)}





E4.extras.ButtonPressessPerDay<-function(rdslocation.buttonpress,ImputeNAs=F,ImputeZeros=F){
  press_summary<-readRDS(paste(rdslocation.buttonpress,"button_presses.RDS",sep=""))

  press_summary$press<-1
  press_summary$date<-anytime::anydate(press_summary$ts)

 press_day<-aggregate(press~ID+date,data=press_summary,FUN="sum")

  if(ImputeNAs==T){
  IDs<-as.numeric(as.character(as.vector(levels(as.factor(press_day$ID)))))
  press_day_w_NAs<-NULL
  for(ID in IDs) {
    press_day_single_P<-press_day[press_day$ID==ID,]
    dates<-(seq(from=anytime::anydate(min(press_day_single_P$date)),to=anytime::anydate(max(press_day_single_P$date)),by=1))
    xx<-as.data.frame(cbind(anytime::anydate(dates),1,ID))
    names(xx)<-c("date","NoPress","ID")
    xx$date<-anytime::anydate(xx$date)
    press_day_single_P<-merge(press_day_single_P,xx,by=c("ID","date"),all.y=T)
    press_day_single_P$NoPress<-NULL
    press_day_w_NAs<-rbind(press_day_single_P,press_day_w_NAs)
  }
  }

 if(ImputeZeros==T){press_day_w_NAs[is.na(press_day_w_NAs$press),]$press<-0}
 if(ImputeNAs==T){return(press_day_w_NAs)}
 if(ImputeNAs==F){return(press_day)}



}





