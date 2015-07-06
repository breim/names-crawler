# to populate uses
# rake meninas:get_name
# rake meninos:get_name

namespace :meninas do
	task :get_name => :environment do 
		agent = Mechanize.new
		batch = []
		150.times do |i|
			i+=1
			page = agent.get("http://www.dicionariodenomesproprios.com.br/nomes-femininos/#{i}/")

			page.links_with(class: 'lista-nome').each do |link|
				nome = link
				page = link.click
				texto = page.search('#significado').to_s
				if texto['<div id="significado">']
					texto['<div id="significado">'] = ''
					texto['</div>'] = ''
				end
				batch << Name.new({
					name: nome,
					description: texto,
					female: true
					});
			end 
			Name.import batch
			batch = []
		end
	end
end

namespace :meninos do
	task :get_name => :environment do 
		agent = Mechanize.new
		batch = []
		200.times do |i|
			i+=1
			page = agent.get("http://www.dicionariodenomesproprios.com.br/nomes-masculinos/#{i}/")
			page.links_with(class: 'lista-nome').each do |link|
				nome = link
				page = link.click
				texto = page.search('#significado').to_s
				if texto['<div id="significado">']
					texto['<div id="significado">'] = ''
					texto['</div>'] = ''
				end
				batch << Name.new({
					name: nome,
					description: texto,
					male: true
					});
			end 
			Name.import batch
			batch = []
		end
	end
end
