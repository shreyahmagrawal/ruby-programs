arr=gets.chomp
a=arr.reverse
number = ''
#for 1000
number= 'M'*a[3].to_i
print number
#for 500
i=2
def convert a, i
	case i
	when 2
	b='D'
	c='C'
	when 1
	b= 'L'
	c= 'X'
    else
    b= 'V'
    c= 'I' 
end
	if a.to_i>= 5
		
		number=number.to_s+ b+ (c*(a.to_i-5))

		print number

	else
		number=number.to_s + (c*a.to_i)
		print number

    end
    
	if a[0]==4
	number=numer.to_s+ 'IV'
    print number
else
convert a[0], 0
end	

end
convert a[2], 2
convert a[1], 1
if a[0]==4
	number=numer.to_s+ 'IV'
    print number
else
convert a[0], 0
end

