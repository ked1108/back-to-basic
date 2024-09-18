#define MAX_LEN 1000

type csv_record
	as integer x, y
end type

dim as csv_record ARR(Any)
dim as integer idx

dim as integer sum_x, sum_y
dim as single sd_xx, sd_xy

function getMinX(byval array() as csv_record, byval length as integer) integer 
	dim min as integer = array(0).x
	for i as integer = 0 to length
		with array(i)
			if (min > .x) then
				min = .x
			end if
		end with
	next i
	return min
end function

idx = 0
open "data.csv" for input as #1
	while not eof(1)
		with ARR(idx)
			input #1, .x, .y
			sum_x += .x
			sum_y += .y
		end with
		idx += 1
	wend
close #1

dim as single mean_x = sum_x/idx
dim as single mean_y = sum_y/idx

for i as integer = 0 to idx-1
	with ARR(i)
		sd_xx += (.x - mean_x)*(.x - mean_x)
		sd_xy += (.x - mean_x)*(.y - mean_y)
	end with
next i

dim as single b = sd_xy / sd_xx
dim as single a = mean_y - b * mean_x
dim as integer x_pred
input "Enter X:    ", x_pred
dim as single y_pred = a + b*x_pred
print "Pred Y:     " & y_pred
print "Min X:		" & getMinX(ARR(), idx)
