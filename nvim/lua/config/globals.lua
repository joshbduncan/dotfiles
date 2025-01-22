P = function(obj, note)
	if note ~= nil then
		print(string.format("** INSPECTING %s **", note))
	end
	print(vim.inspect(obj))
end
