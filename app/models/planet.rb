class Planet < ApplicationRecord
  has_one :store, dependent: :destroy
  has_one :bay, dependent: :destroy
  belongs_to :game

  def x_coord
    I18n.t('planets')[self.name.parameterize.underscore.to_sym][:x_coord]
  end

  def y_coord
    I18n.t('planets')[self.name.parameterize.underscore.to_sym][:y_coord]
  end

  def description
    I18n.t('planets')[self.name.parameterize.underscore.to_sym][:description]
  end

  def history
    I18n.t('planets')[self.name.parameterize.underscore.to_sym][:history]
  end

end
