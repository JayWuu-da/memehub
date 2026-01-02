BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "collection_memes" (
    "id" bigserial PRIMARY KEY,
    "collectionId" bigint NOT NULL,
    "memeId" bigint NOT NULL,
    "addedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "cm_collection_idx" ON "collection_memes" USING btree ("collectionId");
CREATE INDEX "cm_meme_idx" ON "collection_memes" USING btree ("memeId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "collections" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "name" text NOT NULL,
    "description" text,
    "coverMemeId" bigint,
    "memeCount" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "collection_user_idx" ON "collections" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "meme_usages" (
    "id" bigserial PRIMARY KEY,
    "memeId" bigint NOT NULL,
    "userId" bigint,
    "usedAt" timestamp without time zone NOT NULL,
    "source" text NOT NULL
);

-- Indexes
CREATE INDEX "usage_meme_idx" ON "meme_usages" USING btree ("memeId");
CREATE INDEX "usage_time_idx" ON "meme_usages" USING btree ("usedAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "memes" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "storageUrl" text NOT NULL,
    "thumbnailUrl" text,
    "fileType" text NOT NULL,
    "fileSize" bigint NOT NULL,
    "width" bigint NOT NULL,
    "height" bigint NOT NULL,
    "ocrText" text,
    "aiDescription" text,
    "tags" json,
    "isNsfw" boolean NOT NULL,
    "status" text NOT NULL,
    "usageCount" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "meme_user_idx" ON "memes" USING btree ("userId");
CREATE INDEX "meme_status_idx" ON "memes" USING btree ("status");
CREATE INDEX "meme_usage_idx" ON "memes" USING btree ("usageCount");
CREATE INDEX "meme_created_idx" ON "memes" USING btree ("createdAt");


--
-- MIGRATION VERSION FOR memehub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('memehub', '20260102013214763', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260102013214763', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20251208110420531-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110420531-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
