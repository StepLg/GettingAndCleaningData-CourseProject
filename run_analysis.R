# all feature names
fnames <- read.table('UCI HAR Dataset/features.txt',
                     col.names=c('Id', 'Name'), colClasses=c('numeric', 'character'))

# Read all UCI_HAR data from folder
# dname -- directory name
# suffix -- files suffix (train/test)
read.UCI_HAR_dataset <- function(dname, suffix) {
  features <- read.table(paste0(dname, '/X_', suffix, '.txt'),
                         quote='', comment.char='',
                         col.names=fnames$Name,
                         colClasses=rep('numeric', nrow(fnames)))
  
  labels <- read.table(paste0(dname, '/y_', suffix, '.txt'),
                       col.names=c('Activity'), colClasses=c('factor'))
  
  subject <- read.table(paste0(dname, '/subject_', suffix, '.txt'),
                        col.names=c('Subject'), colClasses=c('factor'))
  return(cbind(features, labels, subject))
}

# reading and combining train/test data
train <- read.UCI_HAR_dataset('UCI HAR Dataset/train/', 'train')
test <- read.UCI_HAR_dataset('UCI HAR Dataset/test/', 'test')

all <- rbind(train, test)

# replace activity levels to their labels
activityLevels = read.table('UCI HAR Dataset/activity_labels.txt',
                            col.names=c('Id', 'Activity'), colClasses=c('numeric', 'character'))

library(plyr)
all$Activity = mapvalues(all$Activity, from=as.character(1:6), to=activityLevels$Activity)


# selecting required columns and normalizing their names
fnames.sub <- grep('mean|std', names(all), value=T, ignore.case=T)
fnames.sub.normalized <- fnames.sub
fnames.sub.normalized <- gsub('\\.*$', '', fnames.sub.normalized)
fnames.sub.normalized <- gsub('\\.+', '.', fnames.sub.normalized)

all.sub = all[, fnames.sub]
names(all.sub) <- fnames.sub.normalized
all.sub = cbind(all[, c("Subject", "Activity")], all.sub)

# calculate mean for each variable for each Subject and Activity
all.sub.means <- as.data.frame(t(
  sapply(split(all.sub, list(all.sub$Activity, all.sub$Subject)),
         function(x) apply(x[, 3:ncol(x)], 2, mean))))

# extract Activity and Subject for each row
rnames <- row.names(all.sub.means)
all.sub.means$Activity <- as.factor(sapply(strsplit(rnames, '\\.'), head, n=1))
all.sub.means$Subject <- as.factor(sapply(strsplit(rnames, '\\.'), tail, n=1))

# saving data
write.table(all.sub.means, file='variable_means.tsv', quote=F, sep='\t', row.names=F)
