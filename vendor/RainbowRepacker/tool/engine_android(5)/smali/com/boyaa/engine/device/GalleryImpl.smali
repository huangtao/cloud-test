.class public Lcom/boyaa/engine/device/GalleryImpl;
.super Ljava/lang/Object;
.source "GalleryImpl.java"


# static fields
.field private static final GALLERY_OPEN_CANCEL:I = 0x0

.field private static final GALLERY_OPEN_ERROR:I = -0x1

.field private static final GALLERY_OPEN_NO_PERMISSION:I = -0x2

.field private static final GALLERY_OPEN_SUCCESS:I = 0x1

.field private static final IMAGE_JPG:I = 0x1

.field private static final IMAGE_PNG:I

.field public static REQ_ID_CROP:I

.field public static REQ_ID_GALLERY:I


# instance fields
.field private cropImageName:Ljava/lang/String;

.field public edit:Z

.field public format:I

.field private galleryImageFile:Ljava/io/File;

.field public height:I

.field public path:Ljava/lang/String;

.field public quality:I

.field public title:Ljava/lang/String;

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 30
    sput v0, Lcom/boyaa/engine/device/GalleryImpl;->REQ_ID_GALLERY:I

    .line 31
    sput v0, Lcom/boyaa/engine/device/GalleryImpl;->REQ_ID_CROP:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    .line 47
    return-void
.end method

.method private static checkPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    .locals 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v8, 0x0

    .line 176
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x13

    if-lt v11, v12, :cond_1

    move v3, v9

    .line 179
    .local v3, "isKitKat":Z
    :goto_0
    if-eqz v3, :cond_7

    invoke-static {p0, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 181
    invoke-static {p1}, Lcom/boyaa/engine/device/GalleryImpl;->isExternalStorageDocument(Landroid/net/Uri;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 182
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 183
    .local v1, "docId":Ljava/lang/String;
    const-string v11, ":"

    invoke-virtual {v1, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 184
    .local v6, "split":[Ljava/lang/String;
    aget-object v7, v6, v10

    .line 186
    .local v7, "type":Ljava/lang/String;
    const-string v10, "primary"

    invoke-virtual {v10, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 187
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "/"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v6, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 232
    .end local v1    # "docId":Ljava/lang/String;
    .end local v6    # "split":[Ljava/lang/String;
    .end local v7    # "type":Ljava/lang/String;
    :cond_0
    :goto_1
    return-object v8

    .end local v3    # "isKitKat":Z
    :cond_1
    move v3, v10

    .line 176
    goto :goto_0

    .line 192
    .restart local v3    # "isKitKat":Z
    :cond_2
    invoke-static {p1}, Lcom/boyaa/engine/device/GalleryImpl;->isDownloadsDocument(Landroid/net/Uri;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 193
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 194
    .local v2, "id":Ljava/lang/String;
    const-string v9, "content://downloads/public_downloads"

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    invoke-static {v9, v10, v11}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 196
    .local v0, "contentUri":Landroid/net/Uri;
    invoke-static {p0, v0, v8, v8}, Lcom/boyaa/engine/device/GalleryImpl;->getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 199
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v2    # "id":Ljava/lang/String;
    :cond_3
    invoke-static {p1}, Lcom/boyaa/engine/device/GalleryImpl;->isMediaDocument(Landroid/net/Uri;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 200
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 201
    .restart local v1    # "docId":Ljava/lang/String;
    const-string v8, ":"

    invoke-virtual {v1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 202
    .restart local v6    # "split":[Ljava/lang/String;
    aget-object v7, v6, v10

    .line 204
    .restart local v7    # "type":Ljava/lang/String;
    const/4 v0, 0x0

    .line 205
    .restart local v0    # "contentUri":Landroid/net/Uri;
    const-string v8, "image"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 206
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 213
    :cond_4
    :goto_2
    const-string v4, "_id=?"

    .line 214
    .local v4, "selection":Ljava/lang/String;
    new-array v5, v9, [Ljava/lang/String;

    aget-object v8, v6, v9

    aput-object v8, v5, v10

    .line 216
    .local v5, "selectionArgs":[Ljava/lang/String;
    const-string v8, "_id=?"

    invoke-static {p0, v0, v8, v5}, Lcom/boyaa/engine/device/GalleryImpl;->getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 207
    .end local v4    # "selection":Ljava/lang/String;
    .end local v5    # "selectionArgs":[Ljava/lang/String;
    :cond_5
    const-string v8, "video"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 208
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 209
    goto :goto_2

    :cond_6
    const-string v8, "audio"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 210
    sget-object v0, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_2

    .line 220
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v1    # "docId":Ljava/lang/String;
    .end local v6    # "split":[Ljava/lang/String;
    .end local v7    # "type":Ljava/lang/String;
    :cond_7
    const-string v9, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 222
    invoke-static {p1}, Lcom/boyaa/engine/device/GalleryImpl;->isGooglePhotosUri(Landroid/net/Uri;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 223
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 225
    :cond_8
    invoke-static {p0, p1, v8, v8}, Lcom/boyaa/engine/device/GalleryImpl;->getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_1

    .line 228
    :cond_9
    const-string v9, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 229
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_1
.end method

.method private crop()V
    .locals 8

    .prologue
    .line 142
    :try_start_0
    iget-object v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->canRead()Z

    move-result v5

    if-nez v5, :cond_1

    .line 144
    :cond_0
    new-instance v5, Ljava/lang/Exception;

    const-string v6, "can\'t open file"

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 168
    const/4 v5, -0x1

    invoke-direct {p0, v5}, Lcom/boyaa/engine/device/GalleryImpl;->onResultFailed(I)V

    .line 170
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 146
    :cond_1
    :try_start_1
    iget-object v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    .line 147
    .local v3, "uri":Landroid/net/Uri;
    iget-object v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    iget v6, p0, Lcom/boyaa/engine/device/GalleryImpl;->width:I

    iget v7, p0, Lcom/boyaa/engine/device/GalleryImpl;->height:I

    invoke-static {v5, v6, v7}, Lcom/boyaa/engine/device/Utils;->calcScaleSize(Ljava/lang/String;II)Landroid/graphics/Point;

    move-result-object v2

    .line 149
    .local v2, "size":Landroid/graphics/Point;
    iget v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->format:I

    if-nez v5, :cond_3

    const-string v5, ".png"

    :goto_1
    invoke-static {v5}, Lcom/boyaa/engine/device/Utils;->randomFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->cropImageName:Ljava/lang/String;

    .line 150
    iget-object v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->path:Ljava/lang/String;

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    iget-object v6, p0, Lcom/boyaa/engine/device/GalleryImpl;->path:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-eq v5, v6, :cond_2

    .line 151
    iget-object v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->path:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->path:Ljava/lang/String;

    .line 153
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "file://"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/boyaa/engine/device/GalleryImpl;->path:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/boyaa/engine/device/GalleryImpl;->cropImageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 155
    .local v4, "uriOut":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v5, "com.android.camera.action.CROP"

    invoke-direct {v1, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 156
    .local v1, "intent":Landroid/content/Intent;
    const-string v5, "image/*"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 157
    const-string v5, "aspectX"

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 158
    const-string v5, "aspectY"

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 159
    const-string v5, "outputX"

    iget v6, v2, Landroid/graphics/Point;->x:I

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 160
    const-string v5, "outputY"

    iget v6, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 161
    const-string v5, "scale"

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 162
    const-string v5, "return-data"

    const/4 v6, 0x0

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 163
    const-string v5, "output"

    invoke-virtual {v1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 164
    const-string v6, "outputFormat"

    iget v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->format:I

    if-nez v5, :cond_4

    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v5}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_2
    invoke-virtual {v1, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 165
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v5

    sget v6, Lcom/boyaa/engine/device/GalleryImpl;->REQ_ID_CROP:I

    invoke-virtual {v5, v1, v6}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 149
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v4    # "uriOut":Landroid/net/Uri;
    :cond_3
    const-string v5, ".jpg"

    goto/16 :goto_1

    .line 164
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v4    # "uriOut":Landroid/net/Uri;
    :cond_4
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v5}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_2
.end method

.method private static getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 251
    const/4 v7, 0x0

    .line 252
    .local v7, "cursor":Landroid/database/Cursor;
    const-string v6, "_data"

    .line 253
    .local v6, "column":Ljava/lang/String;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_data"

    aput-object v1, v2, v0

    .line 256
    .local v2, "projection":[Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 257
    if-eqz v7, :cond_3

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 258
    const-string v0, "_data"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 259
    .local v9, "index":I
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 264
    if-eqz v7, :cond_0

    .line 265
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 267
    .end local v9    # "index":I
    :cond_0
    :goto_0
    return-object v0

    .line 261
    :catch_0
    move-exception v8

    .line 262
    .local v8, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 264
    if-eqz v7, :cond_1

    .line 265
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .end local v8    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    move-object v0, v10

    .line 267
    goto :goto_0

    .line 263
    :catchall_0
    move-exception v0

    .line 264
    if-eqz v7, :cond_2

    .line 265
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 266
    :cond_2
    throw v0

    .line 264
    :cond_3
    if-eqz v7, :cond_1

    .line 265
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_1
.end method

.method private static isDownloadsDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 285
    const-string v0, "com.android.providers.downloads.documents"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isExternalStorageDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 276
    const-string v0, "com.android.externalstorage.documents"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isGooglePhotosUri(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 303
    const-string v0, "com.google.android.apps.photos.content"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isMediaDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 294
    const-string v0, "com.android.providers.media.documents"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static native nativeEvent(ILjava/lang/String;)V
.end method

.method private onResultCrop(ILandroid/content/Intent;)V
    .locals 1
    .param p1, "resultCode"    # I
    .param p2, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v0, -0x1

    .line 114
    if-ne p1, v0, :cond_1

    .line 115
    if-nez p2, :cond_0

    .line 116
    invoke-direct {p0, v0}, Lcom/boyaa/engine/device/GalleryImpl;->onResultFailed(I)V

    .line 123
    :goto_0
    return-void

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/boyaa/engine/device/GalleryImpl;->cropImageName:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/boyaa/engine/device/GalleryImpl;->onResultSuccess(Ljava/lang/String;)V

    goto :goto_0

    .line 121
    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/boyaa/engine/device/GalleryImpl;->onResultFailed(I)V

    goto :goto_0
.end method

.method private onResultFailed(I)V
    .locals 2
    .param p1, "flag"    # I

    .prologue
    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    .line 51
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/GalleryImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/engine/device/GalleryImpl$1;-><init>(Lcom/boyaa/engine/device/GalleryImpl;I)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 57
    return-void
.end method

.method private onResultGallery(ILandroid/content/Intent;)V
    .locals 11
    .param p1, "resultCode"    # I
    .param p2, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v10, -0x1

    .line 83
    if-ne p1, v10, :cond_4

    .line 84
    const/4 v6, 0x1

    .line 85
    .local v6, "fail":Z
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    .line 86
    .local v9, "uri":Landroid/net/Uri;
    if-eqz v9, :cond_0

    .line 87
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, v9}, Lcom/boyaa/engine/device/GalleryImpl;->checkPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v7

    .line 88
    .local v7, "file":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 89
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    .line 90
    iget-object v0, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    iget-boolean v0, p0, Lcom/boyaa/engine/device/GalleryImpl;->edit:Z

    if-eqz v0, :cond_2

    .line 92
    const/4 v6, 0x0

    .line 93
    invoke-direct {p0}, Lcom/boyaa/engine/device/GalleryImpl;->crop()V

    .line 104
    .end local v7    # "file":Ljava/lang/String;
    :cond_0
    :goto_0
    if-eqz v6, :cond_1

    .line 105
    invoke-direct {p0, v10}, Lcom/boyaa/engine/device/GalleryImpl;->onResultFailed(I)V

    .line 111
    .end local v6    # "fail":Z
    .end local v9    # "uri":Landroid/net/Uri;
    :cond_1
    :goto_1
    return-void

    .line 95
    .restart local v6    # "fail":Z
    .restart local v7    # "file":Ljava/lang/String;
    .restart local v9    # "uri":Landroid/net/Uri;
    :cond_2
    iget-object v0, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/boyaa/engine/device/GalleryImpl;->width:I

    iget v2, p0, Lcom/boyaa/engine/device/GalleryImpl;->height:I

    iget-object v3, p0, Lcom/boyaa/engine/device/GalleryImpl;->path:Ljava/lang/String;

    iget v4, p0, Lcom/boyaa/engine/device/GalleryImpl;->format:I

    if-nez v4, :cond_3

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    :goto_2
    iget v5, p0, Lcom/boyaa/engine/device/GalleryImpl;->quality:I

    invoke-static/range {v0 .. v5}, Lcom/boyaa/engine/device/Utils;->scaleAndSaveBitmap(Ljava/lang/String;IILjava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)Ljava/lang/String;

    move-result-object v8

    .line 96
    .local v8, "imageName":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 97
    const/4 v6, 0x0

    .line 98
    invoke-direct {p0, v8}, Lcom/boyaa/engine/device/GalleryImpl;->onResultSuccess(Ljava/lang/String;)V

    goto :goto_0

    .line 95
    .end local v8    # "imageName":Ljava/lang/String;
    :cond_3
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_2

    .line 109
    .end local v6    # "fail":Z
    .end local v7    # "file":Ljava/lang/String;
    .end local v9    # "uri":Landroid/net/Uri;
    :cond_4
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/boyaa/engine/device/GalleryImpl;->onResultFailed(I)V

    goto :goto_1
.end method

.method private onResultSuccess(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/GalleryImpl;->galleryImageFile:Ljava/io/File;

    .line 61
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/GalleryImpl$2;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/engine/device/GalleryImpl$2;-><init>(Lcom/boyaa/engine/device/GalleryImpl;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 67
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)Z
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x1

    .line 71
    sget v1, Lcom/boyaa/engine/device/GalleryImpl;->REQ_ID_GALLERY:I

    if-ne p1, v1, :cond_0

    .line 72
    invoke-direct {p0, p2, p3}, Lcom/boyaa/engine/device/GalleryImpl;->onResultGallery(ILandroid/content/Intent;)V

    .line 79
    :goto_0
    return v0

    .line 75
    :cond_0
    sget v1, Lcom/boyaa/engine/device/GalleryImpl;->REQ_ID_CROP:I

    if-ne p1, v1, :cond_1

    .line 76
    invoke-direct {p0, p2, p3}, Lcom/boyaa/engine/device/GalleryImpl;->onResultCrop(ILandroid/content/Intent;)V

    goto :goto_0

    .line 79
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public open()V
    .locals 5

    .prologue
    .line 128
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 129
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "image/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 131
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 132
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/boyaa/engine/device/GalleryImpl;->title:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v3

    sget v4, Lcom/boyaa/engine/device/GalleryImpl;->REQ_ID_GALLERY:I

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 135
    const/4 v2, -0x1

    invoke-direct {p0, v2}, Lcom/boyaa/engine/device/GalleryImpl;->onResultFailed(I)V

    goto :goto_0
.end method
