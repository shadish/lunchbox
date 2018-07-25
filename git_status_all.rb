a = Dir.entries('.')
dirs = Dir.entries('.').select { |entry| File.directory? entry }
dirs = dirs.select { |entry| entry.to_s }.select { |d| !d.start_with? '.' }

dirs.each do |dir|
	if File.exists? "./#{dir}/.git"
		result = `cd ./#{dir} && git status`
		if result.include? 'modified'
				p "==== #{dir} ==="
				puts result
		end
	end
end
