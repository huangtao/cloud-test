.class public Lcom/boyaa/app/image/ChooseImageHandler;
.super Ljava/lang/Object;
.source "ChooseImageHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;
    }
.end annotation


# static fields
.field private static MAXSIZE:I

.field private static s_instance:Lcom/boyaa/app/image/ChooseImageHandler;


# instance fields
.field private activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

.field private aspectX:I

.field private aspectY:I

.field private curActionType:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

.field private headImageUrl:Ljava/lang/String;

.field private imagePath:Ljava/lang/String;

.field private isCrop:Z

.field private isKitKat:Z

.field private isReturnData:Z

.field private mCurrentPhotoFile:Ljava/io/File;

.field private outputX:I

.field private outputY:I

.field private paramMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/app/image/ChooseImageHandler;->s_instance:Lcom/boyaa/app/image/ChooseImageHandler;

    .line 65
    const/16 v0, 0x180

    sput v0, Lcom/boyaa/app/image/ChooseImageHandler;->MAXSIZE:I

    return-void
.end method

.method private constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 5
    .param p1, "activity"    # Lcom/boyaa/enginedlqp/maindevelop/Game;

    .prologue
    const/16 v4, 0x12c

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v0, v3, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isKitKat:Z

    .line 58
    iput-boolean v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isReturnData:Z

    .line 59
    iput-boolean v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isCrop:Z

    .line 60
    iput v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectX:I

    .line 61
    iput v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectY:I

    .line 62
    iput v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputX:I

    .line 63
    iput v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputY:I

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->paramMap:Ljava/util/HashMap;

    .line 76
    iput-object p1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 77
    return-void

    :cond_0
    move v0, v2

    .line 51
    goto :goto_0
.end method

.method static synthetic access$0(Lcom/boyaa/app/image/ChooseImageHandler;)V
    .locals 0

    .prologue
    .line 227
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->doPickPhotoFromGallery()V

    return-void
.end method

.method private doPickPhotoFromGallery()V
    .locals 1

    .prologue
    .line 230
    :try_start_0
    iget-boolean v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isKitKat:Z

    if-eqz v0, :cond_0

    .line 231
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->doPickPhotoFromGalleryAfterAndroid19()V

    .line 239
    :goto_0
    return-void

    .line 233
    :cond_0
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->doPickPhotoFromGalleryBeforeAndroid19()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 235
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private doPickPhotoFromGalleryAfterAndroid19()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 243
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.PICK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 244
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 245
    iget-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    const/16 v2, 0x1002

    invoke-virtual {v1, v0, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game;->startActivityForResult(Landroid/content/Intent;I)V

    .line 246
    return-void
.end method

.method private doPickPhotoFromGalleryBeforeAndroid19()V
    .locals 3

    .prologue
    .line 249
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 250
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 251
    const-string v2, "crop"

    iget-boolean v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isCrop:Z

    if-eqz v1, :cond_0

    const-string v1, "true"

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 252
    const-string v1, "aspectX"

    iget v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectX:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 253
    const-string v1, "aspectY"

    iget v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectY:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 254
    const-string v1, "outputX"

    iget v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputX:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 255
    const-string v1, "outputY"

    iget v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputY:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 256
    const-string v1, "return-data"

    iget-boolean v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isReturnData:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 257
    const-string v1, "output"

    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getTempUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 258
    const-string v1, "outputFormat"

    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v2}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 260
    iget-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    const/16 v2, 0x1002

    invoke-virtual {v1, v0, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game;->startActivityForResult(Landroid/content/Intent;I)V

    .line 261
    return-void

    .line 251
    :cond_0
    const-string v1, "false"

    goto :goto_0
.end method

.method public static getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 562
    const/4 v7, 0x0

    .line 563
    .local v7, "cursor":Landroid/database/Cursor;
    const-string v6, "_data"

    .line 564
    .local v6, "column":Ljava/lang/String;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_data"

    aput-object v1, v2, v0

    .line 567
    .local v2, "projection":[Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 568
    const/4 v5, 0x0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    .line 567
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 569
    if-eqz v7, :cond_2

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 570
    const-string v0, "_data"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v8

    .line 571
    .local v8, "index":I
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 574
    if-eqz v7, :cond_0

    .line 575
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 577
    .end local v8    # "index":I
    :cond_0
    :goto_0
    return-object v0

    .line 573
    :catchall_0
    move-exception v0

    .line 574
    if-eqz v7, :cond_1

    .line 575
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 576
    :cond_1
    throw v0

    .line 574
    :cond_2
    if-eqz v7, :cond_3

    .line 575
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_3
    move-object v0, v9

    .line 577
    goto :goto_0
.end method

.method private getImageName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 646
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v2, "yyMMddHHmmss"

    invoke-direct {v0, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 647
    .local v0, "dateFormat":Ljava/text/SimpleDateFormat;
    new-instance v2, Ljava/lang/StringBuilder;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 648
    .local v1, "imageName":Ljava/lang/String;
    return-object v1
.end method

.method public static getInstance(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/image/ChooseImageHandler;
    .locals 1
    .param p0, "activity"    # Lcom/boyaa/enginedlqp/maindevelop/Game;

    .prologue
    .line 80
    sget-object v0, Lcom/boyaa/app/image/ChooseImageHandler;->s_instance:Lcom/boyaa/app/image/ChooseImageHandler;

    if-nez v0, :cond_0

    .line 81
    invoke-static {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->initInstance(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    .line 83
    :cond_0
    sget-object v0, Lcom/boyaa/app/image/ChooseImageHandler;->s_instance:Lcom/boyaa/app/image/ChooseImageHandler;

    return-object v0
.end method

.method public static getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
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

    .line 484
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x13

    if-lt v11, v12, :cond_1

    move v3, v9

    .line 486
    .local v3, "isKitKat":Z
    :goto_0
    if-eqz v3, :cond_7

    invoke-static {p0, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 487
    invoke-static {p1}, Lcom/boyaa/app/image/ChooseImageHandler;->isExternalStorageDocument(Landroid/net/Uri;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 488
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 489
    .local v1, "docId":Ljava/lang/String;
    const-string v11, ":"

    invoke-virtual {v1, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 490
    .local v6, "split":[Ljava/lang/String;
    aget-object v7, v6, v10

    .line 492
    .local v7, "type":Ljava/lang/String;
    const-string v10, "primary"

    invoke-virtual {v10, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 493
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "/"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 494
    aget-object v9, v6, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 493
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 542
    .end local v1    # "docId":Ljava/lang/String;
    .end local v6    # "split":[Ljava/lang/String;
    .end local v7    # "type":Ljava/lang/String;
    :cond_0
    :goto_1
    return-object v8

    .end local v3    # "isKitKat":Z
    :cond_1
    move v3, v10

    .line 484
    goto :goto_0

    .line 499
    .restart local v3    # "isKitKat":Z
    :cond_2
    invoke-static {p1}, Lcom/boyaa/app/image/ChooseImageHandler;->isDownloadsDocument(Landroid/net/Uri;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 500
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 502
    .local v2, "id":Ljava/lang/String;
    const-string v9, "content://downloads/public_downloads"

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    .line 503
    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    .line 501
    invoke-static {v9, v10, v11}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 505
    .local v0, "contentUri":Landroid/net/Uri;
    invoke-static {p0, v0, v8, v8}, Lcom/boyaa/app/image/ChooseImageHandler;->getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 508
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v2    # "id":Ljava/lang/String;
    :cond_3
    invoke-static {p1}, Lcom/boyaa/app/image/ChooseImageHandler;->isMediaDocument(Landroid/net/Uri;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 509
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 510
    .restart local v1    # "docId":Ljava/lang/String;
    const-string v8, ":"

    invoke-virtual {v1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 511
    .restart local v6    # "split":[Ljava/lang/String;
    aget-object v7, v6, v10

    .line 513
    .restart local v7    # "type":Ljava/lang/String;
    const/4 v0, 0x0

    .line 514
    .restart local v0    # "contentUri":Landroid/net/Uri;
    const-string v8, "image"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 515
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 522
    :cond_4
    :goto_2
    const-string v4, "_id=?"

    .line 523
    .local v4, "selection":Ljava/lang/String;
    new-array v5, v9, [Ljava/lang/String;

    aget-object v8, v6, v9

    aput-object v8, v5, v10

    .line 525
    .local v5, "selectionArgs":[Ljava/lang/String;
    const-string v8, "_id=?"

    invoke-static {p0, v0, v8, v5}, Lcom/boyaa/app/image/ChooseImageHandler;->getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 516
    .end local v4    # "selection":Ljava/lang/String;
    .end local v5    # "selectionArgs":[Ljava/lang/String;
    :cond_5
    const-string v8, "video"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 517
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 518
    goto :goto_2

    :cond_6
    const-string v8, "audio"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 519
    sget-object v0, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_2

    .line 530
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

    .line 532
    invoke-static {p1}, Lcom/boyaa/app/image/ChooseImageHandler;->isGooglePhotosUri(Landroid/net/Uri;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 533
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 535
    :cond_8
    invoke-static {p0, p1, v8, v8}, Lcom/boyaa/app/image/ChooseImageHandler;->getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_1

    .line 538
    :cond_9
    const-string v9, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 539
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_1
.end method

.method private getPath(Landroid/net/Uri;)Ljava/lang/String;
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v9, 0x0

    .line 443
    if-nez p1, :cond_1

    .line 444
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "null uri!"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    :cond_0
    :goto_0
    return-object v9

    .line 447
    :cond_1
    const/4 v9, 0x0

    .line 448
    .local v9, "path":Ljava/lang/String;
    const/4 v7, 0x0

    .line 451
    .local v7, "cursor":Landroid/database/Cursor;
    const/4 v0, 0x1

    :try_start_0
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_data"

    aput-object v1, v2, v0

    .line 452
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    .line 453
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    .line 452
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 454
    if-nez v7, :cond_2

    .line 456
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    .line 457
    const-string v0, "file://"

    const-string v1, ""

    invoke-virtual {v9, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v9

    .line 469
    :goto_1
    if-eqz v7, :cond_0

    .line 471
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 472
    :catch_0
    move-exception v8

    .line 473
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 460
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_2
    const-string v0, "_data"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 461
    .local v6, "column_index":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 462
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v9

    goto :goto_1

    .line 464
    .end local v2    # "projection":[Ljava/lang/String;
    .end local v6    # "column_index":I
    :catch_1
    move-exception v0

    .line 469
    if-eqz v7, :cond_0

    .line 471
    :try_start_3
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 472
    :catch_2
    move-exception v8

    .line 473
    .restart local v8    # "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 465
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v0

    .line 469
    if-eqz v7, :cond_0

    .line 471
    :try_start_4
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_0

    .line 472
    :catch_4
    move-exception v8

    .line 473
    .restart local v8    # "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 466
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_5
    move-exception v8

    .line 467
    .restart local v8    # "e":Ljava/lang/Exception;
    :try_start_5
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 469
    if-eqz v7, :cond_0

    .line 471
    :try_start_6
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_0

    .line 472
    :catch_6
    move-exception v8

    .line 473
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 468
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    .line 469
    if-eqz v7, :cond_3

    .line 471
    :try_start_7
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 476
    :cond_3
    :goto_2
    throw v0

    .line 472
    :catch_7
    move-exception v8

    .line 473
    .restart local v8    # "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method private getPhotoImageUri()Landroid/net/Uri;
    .locals 3

    .prologue
    .line 627
    iget-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->mCurrentPhotoFile:Ljava/io/File;

    if-nez v1, :cond_0

    .line 628
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->imagePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 629
    .local v0, "fileDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 630
    new-instance v1, Ljava/io/File;

    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getImageName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->mCurrentPhotoFile:Ljava/io/File;

    .line 632
    .end local v0    # "fileDir":Ljava/io/File;
    :cond_0
    iget-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->mCurrentPhotoFile:Ljava/io/File;

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method private getStrDictName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 637
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->curActionType:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    sget-object v1, Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;->FEEDBACK:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    if-ne v0, v1, :cond_0

    .line 638
    const-string v0, "chooseImage"

    .line 642
    :goto_0
    return-object v0

    .line 639
    :cond_0
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->curActionType:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    sget-object v1, Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;->HEADIMAGE:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    if-ne v0, v1, :cond_1

    .line 640
    sget-object v0, Lcom/boyaa/app/core/HandlerManager;->kUploadHeadImage:Ljava/lang/String;

    goto :goto_0

    .line 642
    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method private getTempUri()Landroid/net/Uri;
    .locals 3

    .prologue
    .line 622
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "file:///"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/boyaa/util/SDCardUtil;->getExternalStorageRootDirectory()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "tempChooseImage.jpg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 623
    .local v0, "imageUri":Landroid/net/Uri;
    return-object v0
.end method

.method private static declared-synchronized initInstance(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 2
    .param p0, "activity"    # Lcom/boyaa/enginedlqp/maindevelop/Game;

    .prologue
    .line 87
    const-class v1, Lcom/boyaa/app/image/ChooseImageHandler;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/app/image/ChooseImageHandler;->s_instance:Lcom/boyaa/app/image/ChooseImageHandler;

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Lcom/boyaa/app/image/ChooseImageHandler;

    invoke-direct {v0, p0}, Lcom/boyaa/app/image/ChooseImageHandler;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    sput-object v0, Lcom/boyaa/app/image/ChooseImageHandler;->s_instance:Lcom/boyaa/app/image/ChooseImageHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    :cond_0
    monitor-exit v1

    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static isDownloadsDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 596
    const-string v0, "com.android.providers.downloads.documents"

    .line 597
    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    .line 596
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isExternalStorageDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 586
    const-string v0, "com.android.externalstorage.documents"

    .line 587
    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    .line 586
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isExternalStorageWriteable()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 211
    invoke-static {}, Lcom/boyaa/app/common/SDTools;->isExternalStorageWriteable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 212
    iget-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 213
    const v2, 0x7f07003a

    .line 212
    invoke-static {v1, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    .line 214
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 218
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isGooglePhotosUri(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 616
    const-string v0, "com.google.android.apps.photos.content"

    .line 617
    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    .line 616
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isMediaDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 606
    const-string v0, "com.android.providers.media.documents"

    .line 607
    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    .line 606
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static path2Uri(Ljava/lang/String;)Landroid/net/Uri;
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 436
    if-nez p0, :cond_0

    .line 437
    const/4 v0, 0x0

    .line 439
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "file://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0
.end method

.method private reInitParams()V
    .locals 5

    .prologue
    const/16 v4, 0x12c

    const/4 v3, 0x1

    .line 96
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isReturnData:Z

    .line 97
    iput-boolean v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isCrop:Z

    .line 98
    iput v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectX:I

    .line 99
    iput v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectY:I

    .line 100
    iput v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputX:I

    .line 101
    iput v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputY:I

    .line 104
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getTempUri()Landroid/net/Uri;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/boyaa/app/image/ChooseImageHandler;->getPath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 105
    .local v1, "filePath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 106
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 107
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 109
    :cond_0
    return-void
.end method

.method private showChooseDialog()V
    .locals 4

    .prologue
    .line 187
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-virtual {v2}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07003e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 188
    iget-object v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-virtual {v2}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07003f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 189
    .local v0, "items":[Ljava/lang/String;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 190
    const v2, 0x7f070040

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 191
    const/4 v2, -0x1

    .line 192
    new-instance v3, Lcom/boyaa/app/image/ChooseImageHandler$1;

    invoke-direct {v3, p0}, Lcom/boyaa/app/image/ChooseImageHandler$1;-><init>(Lcom/boyaa/app/image/ChooseImageHandler;)V

    .line 191
    invoke-virtual {v1, v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 206
    const v2, 0x7f07002e

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 207
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 208
    return-void
.end method


# virtual methods
.method public doCropPhoto(Landroid/net/Uri;)V
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 329
    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-static {v3, p1}, Lcom/boyaa/app/image/ChooseImageHandler;->getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/boyaa/app/image/ChooseImageHandler;->path2Uri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 331
    .local v1, "imageUri":Landroid/net/Uri;
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.android.camera.action.CROP"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 332
    .local v2, "intent":Landroid/content/Intent;
    const-string v3, "image/*"

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 333
    const-string v4, "crop"

    iget-boolean v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isCrop:Z

    if-eqz v3, :cond_0

    const-string v3, "true"

    :goto_0
    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 334
    const-string v3, "aspectX"

    iget v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectX:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 335
    const-string v3, "aspectY"

    iget v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectY:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 336
    const-string v3, "outputX"

    iget v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputX:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 337
    const-string v3, "outputY"

    iget v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputY:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 338
    const-string v3, "return-data"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 339
    const-string v3, "output"

    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getTempUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 340
    const-string v3, "outputFormat"

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v4}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 341
    const-string v3, "android.intent.extra.screenOrientation"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 343
    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    const/16 v4, 0x1003

    invoke-virtual {v3, v2, v4}, Lcom/boyaa/enginedlqp/maindevelop/Game;->startActivityForResult(Landroid/content/Intent;I)V

    .line 347
    .end local v2    # "intent":Landroid/content/Intent;
    :goto_1
    return-void

    .line 333
    .restart local v2    # "intent":Landroid/content/Intent;
    :cond_0
    const-string v3, "false"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 344
    .end local v2    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 345
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public doTakePhoto()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 292
    :try_start_0
    new-instance v1, Ljava/io/File;

    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->imagePath:Ljava/lang/String;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 293
    .local v1, "fileDir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 294
    new-instance v3, Ljava/io/File;

    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getImageName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->mCurrentPhotoFile:Ljava/io/File;

    .line 296
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 297
    .local v2, "intent":Landroid/content/Intent;
    const-string v3, "android.media.action.IMAGE_CAPTURE"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 298
    const-string v3, "output"

    iget-object v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->mCurrentPhotoFile:Ljava/io/File;

    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 299
    const-string v3, "android.intent.extras.CAMERA_FACING"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 300
    const-string v3, "autofocus"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 301
    const-string v3, "fullScreen"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 302
    const-string v3, "showActionIcons"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 303
    const-string v3, "android.intent.extra.screenOrientation"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 304
    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    const/16 v4, 0x1001

    invoke-virtual {v3, v2, v4}, Lcom/boyaa/enginedlqp/maindevelop/Game;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 311
    .end local v1    # "fileDir":Ljava/io/File;
    .end local v2    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 306
    :catch_0
    move-exception v0

    .line 307
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 308
    const v4, 0x7f07003b

    .line 307
    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    .line 309
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public onPickPhotoFromGalleryFinish(Landroid/content/Intent;)V
    .locals 4
    .param p1, "data"    # Landroid/content/Intent;

    .prologue
    .line 267
    iget-boolean v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isKitKat:Z

    if-eqz v1, :cond_2

    .line 268
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 269
    .local v0, "imageUri":Landroid/net/Uri;
    if-nez v0, :cond_0

    .line 270
    iget-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 271
    const v2, 0x7f070043

    const/4 v3, 0x1

    .line 270
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    .line 272
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 284
    .end local v0    # "imageUri":Landroid/net/Uri;
    :goto_0
    return-void

    .line 275
    .restart local v0    # "imageUri":Landroid/net/Uri;
    :cond_0
    iget-boolean v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isCrop:Z

    if-eqz v1, :cond_1

    .line 277
    invoke-virtual {p0, v0}, Lcom/boyaa/app/image/ChooseImageHandler;->doCropPhoto(Landroid/net/Uri;)V

    goto :goto_0

    .line 279
    :cond_1
    invoke-virtual {p0, p1}, Lcom/boyaa/app/image/ChooseImageHandler;->onSaveBitmap(Landroid/content/Intent;)V

    goto :goto_0

    .line 282
    .end local v0    # "imageUri":Landroid/net/Uri;
    :cond_2
    invoke-virtual {p0, p1}, Lcom/boyaa/app/image/ChooseImageHandler;->onSaveBitmap(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onSaveBitmap(Landroid/content/Intent;)V
    .locals 14
    .param p1, "data"    # Landroid/content/Intent;

    .prologue
    .line 353
    if-nez p1, :cond_0

    .line 433
    :goto_0
    return-void

    .line 358
    :cond_0
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getImageName()Ljava/lang/String;

    move-result-object v5

    .line 359
    .local v5, "imageName":Ljava/lang/String;
    const-string v0, "data"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    .line 360
    .local v1, "photo":Landroid/graphics/Bitmap;
    const/4 v12, 0x0

    .line 361
    .local v12, "savesucess":Z
    if-eqz v1, :cond_3

    .line 362
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->imagePath:Ljava/lang/String;

    invoke-static {v0, v3, v5, v1}, Lcom/boyaa/app/common/SDTools;->saveBitmap(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    move-result v12

    .line 363
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 364
    const/4 v1, 0x0

    .line 404
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getStrDictName()Ljava/lang/String;

    move-result-object v4

    .line 406
    .local v4, "strDicName":Ljava/lang/String;
    if-eqz v12, :cond_7

    .line 407
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->curActionType:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    sget-object v3, Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;->HEADIMAGE:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    if-ne v0, v3, :cond_2

    .line 409
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->imagePath:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 410
    .local v2, "fullPath":Ljava/lang/String;
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->paramMap:Ljava/util/HashMap;

    .line 411
    iget-object v6, p0, Lcom/boyaa/app/image/ChooseImageHandler;->headImageUrl:Ljava/lang/String;

    .line 410
    invoke-static/range {v0 .. v6}, Lcom/boyaa/app/image/UploadHeadImage;->uploadPhoto(Lcom/boyaa/enginedlqp/maindevelop/Game;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    .end local v2    # "fullPath":Ljava/lang/String;
    :cond_2
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    new-instance v3, Lcom/boyaa/app/image/ChooseImageHandler$2;

    invoke-direct {v3, p0, v5, v4}, Lcom/boyaa/app/image/ChooseImageHandler$2;-><init>(Lcom/boyaa/app/image/ChooseImageHandler;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Lcom/boyaa/enginedlqp/maindevelop/Game;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 366
    .end local v4    # "strDicName":Ljava/lang/String;
    :cond_3
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v13

    .line 367
    .local v13, "uri":Landroid/net/Uri;
    if-eqz v13, :cond_6

    .line 368
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-static {v0, v13}, Lcom/boyaa/app/image/ChooseImageHandler;->getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v11

    .line 369
    .local v11, "path":Ljava/lang/String;
    const-string v0, "photo"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, "photo path:"

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    if-nez v11, :cond_4

    .line 371
    const/4 v12, 0x0

    .line 374
    :cond_4
    new-instance v10, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v10}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 375
    .local v10, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v0, 0x1

    iput-boolean v0, v10, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 377
    invoke-static {v11, v10}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 378
    iget v0, v10, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v3, v10, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-le v0, v3, :cond_5

    iget v9, v10, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 380
    .local v9, "maxlen":I
    :goto_2
    sget v0, Lcom/boyaa/app/image/ChooseImageHandler;->MAXSIZE:I

    div-int v0, v9, v0

    iput v0, v10, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 382
    const/4 v0, 0x0

    iput-boolean v0, v10, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 384
    invoke-static {v11, v10}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 385
    if-eqz v1, :cond_1

    .line 386
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->imagePath:Ljava/lang/String;

    invoke-static {v0, v3, v5, v1}, Lcom/boyaa/app/common/SDTools;->saveBitmap(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    move-result v12

    .line 388
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 389
    const/4 v1, 0x0

    .line 391
    goto/16 :goto_1

    .line 379
    .end local v9    # "maxlen":I
    :cond_5
    iget v9, v10, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    goto :goto_2

    .line 393
    .end local v10    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v11    # "path":Ljava/lang/String;
    :cond_6
    :try_start_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getTempUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 394
    .local v7, "bitmap":Landroid/graphics/Bitmap;
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    iget-object v3, p0, Lcom/boyaa/app/image/ChooseImageHandler;->imagePath:Ljava/lang/String;

    invoke-static {v0, v3, v5, v7}, Lcom/boyaa/app/common/SDTools;->saveBitmap(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    move-result v12

    .line 396
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 398
    .end local v7    # "bitmap":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v8

    .line 399
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 425
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v13    # "uri":Landroid/net/Uri;
    .restart local v4    # "strDicName":Ljava/lang/String;
    :cond_7
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    new-instance v3, Lcom/boyaa/app/image/ChooseImageHandler$3;

    invoke-direct {v3, p0, v4}, Lcom/boyaa/app/image/ChooseImageHandler$3;-><init>(Lcom/boyaa/app/image/ChooseImageHandler;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Lcom/boyaa/enginedlqp/maindevelop/Game;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0
.end method

.method public onTakePhotoFinish(Landroid/content/Intent;)V
    .locals 2
    .param p1, "data"    # Landroid/content/Intent;

    .prologue
    .line 318
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler;->mCurrentPhotoFile:Ljava/io/File;

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/boyaa/app/image/ChooseImageHandler;->doCropPhoto(Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 322
    :goto_0
    return-void

    .line 319
    :catch_0
    move-exception v0

    .line 320
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public startUploadFeedbackImage(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->isExternalStorageWriteable()Z

    move-result v4

    if-nez v4, :cond_0

    .line 145
    :goto_0
    return-void

    .line 119
    :cond_0
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->reInitParams()V

    .line 121
    sget-object v4, Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;->FEEDBACK:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    iput-object v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->curActionType:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    .line 123
    const/4 v1, 0x0

    .line 124
    .local v1, "isNeedCamera":Z
    const-string v4, "data"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 125
    .local v3, "jsonStr":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 127
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 128
    .local v2, "jsonResult":Lorg/json/JSONObject;
    const-string v4, "isNeedCamera"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 129
    const-string v4, "imagePath"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->imagePath:Ljava/lang/String;

    .line 130
    const-string v4, "aspectX"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectX:I

    .line 131
    const-string v4, "aspectY"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->aspectY:I

    .line 132
    const-string v4, "outputX"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputX:I

    .line 133
    const-string v4, "outputY"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->outputY:I

    .line 134
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/boyaa/app/image/ChooseImageHandler;->isCrop:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    .line 141
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->showChooseDialog()V

    goto :goto_0

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 143
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->doPickPhotoFromGallery()V

    goto :goto_0
.end method

.method public startUploadHeadImage(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 151
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->isExternalStorageWriteable()Z

    move-result v8

    if-nez v8, :cond_0

    .line 181
    :goto_0
    return-void

    .line 155
    :cond_0
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->reInitParams()V

    .line 157
    sget-object v8, Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;->HEADIMAGE:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    iput-object v8, p0, Lcom/boyaa/app/image/ChooseImageHandler;->curActionType:Lcom/boyaa/app/image/ChooseImageHandler$ACTION_TYPE;

    .line 159
    const-string v8, "data"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 161
    .local v4, "jsonstr":Ljava/lang/String;
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 163
    .local v3, "jsonResult":Lorg/json/JSONObject;
    const-string v8, "imagePath"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/boyaa/app/image/ChooseImageHandler;->imagePath:Ljava/lang/String;

    .line 164
    const-string v8, "url"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/boyaa/app/image/ChooseImageHandler;->headImageUrl:Ljava/lang/String;

    .line 165
    const-string v8, "app"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 166
    .local v1, "app":Ljava/lang/String;
    const-string v8, "ssid"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 167
    .local v5, "ssid":Ljava/lang/String;
    const-string v8, "action"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 168
    .local v0, "action":Ljava/lang/String;
    iget-object v8, p0, Lcom/boyaa/app/image/ChooseImageHandler;->paramMap:Ljava/util/HashMap;

    const-string v9, "app"

    invoke-virtual {v8, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    iget-object v8, p0, Lcom/boyaa/app/image/ChooseImageHandler;->paramMap:Ljava/util/HashMap;

    const-string v9, "ssid"

    invoke-virtual {v8, v9, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    iget-object v8, p0, Lcom/boyaa/app/image/ChooseImageHandler;->paramMap:Ljava/util/HashMap;

    const-string v9, "action"

    invoke-virtual {v8, v9, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    const-string v8, "upLoadFileCallBack"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 172
    .local v7, "upLoadFileCallBack":Ljava/lang/String;
    const-string v8, "uploadTeamIconCallBack"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 173
    const-string v8, "tid"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 174
    .local v6, "tid":Ljava/lang/String;
    iget-object v8, p0, Lcom/boyaa/app/image/ChooseImageHandler;->paramMap:Ljava/util/HashMap;

    const-string v9, "tid"

    invoke-virtual {v8, v9, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "app":Ljava/lang/String;
    .end local v3    # "jsonResult":Lorg/json/JSONObject;
    .end local v5    # "ssid":Ljava/lang/String;
    .end local v6    # "tid":Ljava/lang/String;
    .end local v7    # "upLoadFileCallBack":Ljava/lang/String;
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->showChooseDialog()V

    goto :goto_0

    .line 176
    :catch_0
    move-exception v2

    .line 177
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method
