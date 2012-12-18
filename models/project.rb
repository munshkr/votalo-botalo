class Project < Sequel::Model
  plugin :schema

  set_schema do
    primary_key :id
    Integer :numeroExpediente, unique: true
    String :autor, length: 200
    String :coautores, text: true
    String :descripcion, text: true
    String :origen, length: 50
    String :tipo, length: 50
    String :bloque, length: 50
    String :url
    Date :entrada
  end

  one_to_many :votes

  def positive_votes
    votes_dataset.where(voto: 1)
  end

  def negative_votes
    votes_dataset.where(voto: (-1))
  end

  def voted_by?(user)
    !votes_dataset.where(user: user).empty?
  end

  def vote_from(user)
    votes_dataset.where(user: user).first
  end

  def self.top
    rows = DB["""
      SELECT projects.id, SUM(votes.voto) AS suma
      FROM projects
      INNER JOIN votes ON votes.project_id = projects.id
      WHERE voto = 1
      GROUP BY projects.id
      ORDER BY suma DESC
      LIMIT 10
    """].all

    self.where(id: rows.map{|row| row[:id] })
  end

  def self.recent
    self
      .limit(10)
      .order(:entrada.desc)
  end
end
