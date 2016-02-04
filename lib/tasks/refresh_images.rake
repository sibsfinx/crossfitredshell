namespace :carrierwave do
  desc "recreate carrierwave images"
  task :recreate_assets => :environment do
    #Rich::RichFile.find_each do |rich_file|
    #  rich_file.rich_file.recreate_versions!
    #end

    #Slide.find_each do |m|
    #  if m.image.present?
    #    m.image.recreate_versions!
    #  end
    #end

    Coach.find_each do |m|
      if m.image.present?
        m.image.recreate_versions!
      end
    end

    Post.find_each do |m|
      if m.image.present?
        m.image.recreate_versions!
      end
    end

  end
end

