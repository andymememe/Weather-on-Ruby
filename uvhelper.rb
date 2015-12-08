def uv_helper(uvv)
	if uvv <= 2.9 then
		level = "低"
		msg = "白天建議要帶太陽眼鏡；積雪時記得要抹防晒油，以防雪地反射之UV輻射"
	elsif uvv > 2.9 and uvv <= 5.9 then
		level = "中"
		msg = "出外要有防曬準備，中午盡量待在陰涼處"
	elsif uvv > 5.9 and uvv <= 7.9 then
		level = "高"
		msg = "要穿防曬衣物，使用SPF 30+的防晒油，穿戴帽子和太陽眼鏡，正午三小時盡量減少出門"
	elsif uvv > 7.9 and uvv <= 10.9 then
		level = "很高"
		msg = "使用SPF 30+的防晒油，穿著襯衫，配戴太陽眼鏡及寬簷帽；盡量不要在太陽下曝曬太久"
	elsif uvv > 10.9 then
		level = "極高"
		msg = "全副武裝，使用SPF 30+的防晒油，穿著長袖襯衫，配戴太陽眼鏡及極寬簷帽；避免在正午三小時照射到陽光"
	end
	
	result = {"level" => level,"msg" => msg}
	return result
end
