-- +goose Up
CREATE TABLE
   products (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
      name TEXT NOT NULL CHECK (char_length(name) > 0),
      price BIGINT NOT NULL CHECK (price >= 0),
      quantity INT NOT NULL DEFAULT 0 CHECK (quantity >= 0),
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW (),
      updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW ()
   );

-- +goose Down
DROP TABLE products;