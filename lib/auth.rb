class Auth

  ALGORITHM = 'HS256'


  def self.secret_key
    "ae12b2d9e5ce873dc00719fdd949c96c52d9536e5f8a704890512d0f9c17d96a837d127da609186e6606f55b20c8e941311fc06251428e69e1a1fc505a052092" #rake secret
  end

  def self.encrypt(hash)
    token = JWT.encode(hash, secret_key, ALGORITHM) #JWT.encode( hash,secret_key, ALGORITHM)
  end

  def self.decode(payload)
      JWT.decode(payload, secret_key, true, {algorithm: ALGORITHM}).first
  end
end
