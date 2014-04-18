using DataFrames

function pollutantmean(dir, pollutant, id=1:332)
  files = [ @sprintf("%s/%03d.csv", dir, i) for i in id ]
  datasets = [ readtable(file) for file in files ]
  sums = [ sum(removeNA(getindex(data, pollutant))) for data in datasets ]
  lengths = [ length(removeNA(getindex(data, pollutant))) for data in datasets ]
  round(sum(sums) / sum(lengths), 3)
end
