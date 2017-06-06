require("pg")

class BountyHunter

attr_accessor :name, :bounty_value, :favourite_weapon, :danger_level
attr_reader :id


  def initialize(options)

    @name = options["name"]
    @bounty_value = options["bounty_value"].to_i
    @favourite_weapon = options["favourite_weapon"]
    @danger_level = options["danger_level"]
    @id = options ["id"].to_i() if options ["id"]
  end



def save()
  db = PG.connect({
    dbname: "bounty",
    host: "localhost"
})
  sql = "INSERT INTO bounty_hunters
    (
    name,
    bounty_value,
    favourite_weapon,
    danger_level
    )
    VALUES
    (
      '#{name}',
      '#{bounty_value}',
      '#{favourite_weapon}',
      '#{danger_level}'
      ) RETURNING id"
      @id = db.exec(sql)[0]["id"].to_i()
      db.close()
end




def update
  db = PG.connect({
    dbname: "bounty",
    host: "localhost"
    })

sql = "UPDATE bounty_hunters SET
(
name,
bounty_value,
favourite_weapon,
danger_level
)
VALUES
(
  '#{name}',
  '#{bounty_value}',
  '#{favourite_weapon}',
  '#{danger_level}'
) WHERE id = #{@id}"
db.exec(sql)
db.close()
end





def delete
  db = PG.connect({
    dbname: "bounty",
    host: "localhost"
    })
  sql = "DELETE FROM bounty_hunters
  WHERE id = #{@id}"
 db.exec(sql)
 db.close()
end




def BountyHunter.find(id)
  db = PG.connect({
    dbname: "bounty",
    host: "localhost"
    })
sql = "SELECT FROM bounty_hunters WHERE id = #{id}"
# bounty_hashes = db.exec(sql)
# db.close()


hash = db.exec(sql)[0]
db.close()
return BountyHunter.new(hash)
end






end