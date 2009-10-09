namespace :radiant do
  namespace :extensions do
    namespace :bespin_editor do
      desc "Copies public assets of the Bespin Editor to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from BespinEditorExtension"
        Dir[BespinEditorExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(BespinEditorExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
