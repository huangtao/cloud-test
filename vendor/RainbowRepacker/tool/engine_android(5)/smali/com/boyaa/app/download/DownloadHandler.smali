.class public Lcom/boyaa/app/download/DownloadHandler;
.super Ljava/lang/Object;
.source "DownloadHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/app/download/DownloadHandler$DownloadItem;,
        Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;
    }
.end annotation


# static fields
.field private static final DL_ID:Ljava/lang/String; = "downloadId"

.field private static final TAG_LOG:Ljava/lang/String; = "DownloadHandler"


# instance fields
.field private isUseSysDownload:Z

.field private mCompleteListener:Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;

.field private mContext:Landroid/content/Context;

.field private mDownloadCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/boyaa/app/download/DownloadHandler$DownloadItem;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadManager:Landroid/app/DownloadManager;

.field private mDownloadReceiver:Landroid/content/BroadcastReceiver;

.field private mSP:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/app/download/DownloadHandler;->isUseSysDownload:Z

    .line 29
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadCache:Ljava/util/HashMap;

    .line 31
    new-instance v0, Lcom/boyaa/app/download/DownloadHandler$1;

    invoke-direct {v0, p0}, Lcom/boyaa/app/download/DownloadHandler$1;-><init>(Lcom/boyaa/app/download/DownloadHandler;)V

    iput-object v0, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadReceiver:Landroid/content/BroadcastReceiver;

    .line 58
    iput-object p1, p0, Lcom/boyaa/app/download/DownloadHandler;->mContext:Landroid/content/Context;

    .line 59
    invoke-direct {p0}, Lcom/boyaa/app/download/DownloadHandler;->init()V

    .line 60
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/app/download/DownloadHandler;)Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadCache:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$1(Lcom/boyaa/app/download/DownloadHandler;Lcom/boyaa/app/download/DownloadHandler$DownloadItem;)Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    .locals 1

    .prologue
    .line 256
    invoke-direct {p0, p1}, Lcom/boyaa/app/download/DownloadHandler;->parseDownloadByItem(Lcom/boyaa/app/download/DownloadHandler$DownloadItem;)Lcom/boyaa/app/download/DownloadHandler$DownloadItem;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Lcom/boyaa/app/download/DownloadHandler;)Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;
    .locals 1

    .prologue
    .line 355
    iget-object v0, p0, Lcom/boyaa/app/download/DownloadHandler;->mCompleteListener:Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;

    return-object v0
.end method

.method static synthetic access$3(Lcom/boyaa/app/download/DownloadHandler;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/boyaa/app/download/DownloadHandler;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private downloadByBrowser(Ljava/lang/String;)V
    .locals 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 126
    invoke-static {p1}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "extension":Ljava/lang/String;
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 128
    .local v2, "mimeType":Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 129
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 131
    iget-object v3, p0, Lcom/boyaa/app/download/DownloadHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 132
    return-void
.end method

.method private downloadBySystem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "desc"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 138
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 139
    .local v4, "uri":Landroid/net/Uri;
    new-instance v3, Landroid/app/DownloadManager$Request;

    invoke-direct {v3, v4}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 140
    .local v3, "request":Landroid/app/DownloadManager$Request;
    const/4 v6, 0x3

    invoke-virtual {v3, v6}, Landroid/app/DownloadManager$Request;->setAllowedNetworkTypes(I)Landroid/app/DownloadManager$Request;

    .line 141
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Landroid/app/DownloadManager$Request;->setAllowedOverRoaming(Z)Landroid/app/DownloadManager$Request;

    .line 142
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 143
    invoke-static {p1}, Lcom/boyaa/app/download/DownloadHandler;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 145
    :cond_0
    invoke-virtual {v3, p3}, Landroid/app/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 146
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 147
    invoke-virtual {v3, p4}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 149
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 150
    sget-object v6, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v6}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 151
    sget-object v6, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v3, v6, p3}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 160
    :goto_0
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 161
    .local v5, "version":I
    const/16 v6, 0x9

    if-lt v5, v6, :cond_2

    .line 162
    const/16 v6, 0xb

    if-ge v5, v6, :cond_5

    .line 163
    invoke-virtual {v3, v7}, Landroid/app/DownloadManager$Request;->setShowRunningNotification(Z)Landroid/app/DownloadManager$Request;

    .line 167
    :cond_2
    :goto_1
    new-instance v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;

    invoke-direct {v2, p0}, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;-><init>(Lcom/boyaa/app/download/DownloadHandler;)V

    .line 168
    .local v2, "item":Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    iget-object v6, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v6, v3}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v6

    iput-wide v6, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->downloadId:J

    .line 169
    iput-object p1, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->url:Ljava/lang/String;

    .line 170
    iput-object p3, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->name:Ljava/lang/String;

    .line 171
    iput-object p2, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->path:Ljava/lang/String;

    .line 172
    iget-object v6, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadCache:Ljava/util/HashMap;

    iget-wide v7, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->downloadId:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v6, v7, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    const-string v6, "wanpg"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "\u5f00\u59cb\u4e0b\u8f7d\uff1a"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v8, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->downloadId:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    return-void

    .line 153
    .end local v2    # "item":Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    .end local v5    # "version":I
    :cond_3
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 154
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 155
    .local v1, "fp":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_4

    .line 156
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 158
    :cond_4
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/app/DownloadManager$Request;->setDestinationUri(Landroid/net/Uri;)Landroid/app/DownloadManager$Request;

    goto :goto_0

    .line 165
    .end local v0    # "f":Ljava/io/File;
    .end local v1    # "fp":Ljava/io/File;
    .restart local v5    # "version":I
    :cond_5
    invoke-virtual {v3, v7}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    goto :goto_1
.end method

.method private init()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 65
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-ge v0, v1, :cond_1

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/app/download/DownloadHandler;->isUseSysDownload:Z

    .line 70
    :goto_0
    iget-boolean v0, p0, Lcom/boyaa/app/download/DownloadHandler;->isUseSysDownload:Z

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/boyaa/app/download/DownloadHandler;->mContext:Landroid/content/Context;

    const-string v1, "download"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    iput-object v0, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadManager:Landroid/app/DownloadManager;

    .line 72
    invoke-direct {p0}, Lcom/boyaa/app/download/DownloadHandler;->regeisterReceiver()V

    .line 74
    :cond_0
    return-void

    .line 68
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/app/download/DownloadHandler;->isUseSysDownload:Z

    goto :goto_0
.end method

.method private parseDownload(J)Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    .locals 7
    .param p1, "dId"    # J
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 291
    const/4 v0, 0x0

    .line 293
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v3, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadManager:Landroid/app/DownloadManager;

    new-instance v4, Landroid/app/DownloadManager$Query;

    invoke-direct {v4}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v5, 0x1

    new-array v5, v5, [J

    const/4 v6, 0x0

    aput-wide p1, v5, v6

    invoke-virtual {v4, v5}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 294
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 295
    new-instance v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;

    invoke-direct {v2, p0}, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;-><init>(Lcom/boyaa/app/download/DownloadHandler;)V

    .line 296
    .local v2, "item":Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    iput-wide p1, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->downloadId:J

    .line 297
    const-string v3, "title"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->name:Ljava/lang/String;

    .line 298
    const-string v3, "local_uri"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "file://"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->path:Ljava/lang/String;

    .line 299
    const-string v3, "uri"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->url:Ljava/lang/String;

    .line 300
    const-string v3, "media_type"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->type:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 306
    if-eqz v0, :cond_0

    .line 312
    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 320
    .end local v2    # "item":Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    :cond_0
    :goto_0
    return-object v2

    .line 314
    .restart local v2    # "item":Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    :catch_0
    move-exception v1

    .line 316
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 303
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "item":Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    :catch_1
    move-exception v1

    .line 304
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_2
    const-string v3, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 306
    if-eqz v0, :cond_1

    .line 312
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 320
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 314
    .restart local v1    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v1

    .line 316
    const-string v3, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 305
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    .line 306
    if-eqz v0, :cond_2

    .line 312
    :try_start_4
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 319
    :cond_2
    :goto_2
    throw v3

    .line 314
    :catch_3
    move-exception v1

    .line 316
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v4, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 306
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    if-eqz v0, :cond_1

    .line 312
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_1

    .line 314
    :catch_4
    move-exception v1

    .line 316
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v3, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private parseDownloadByItem(Lcom/boyaa/app/download/DownloadHandler$DownloadItem;)Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    .locals 8
    .param p1, "item"    # Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 258
    const/4 v0, 0x0

    .line 260
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v2, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadManager:Landroid/app/DownloadManager;

    new-instance v3, Landroid/app/DownloadManager$Query;

    invoke-direct {v3}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [J

    const/4 v5, 0x0

    iget-wide v6, p1, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->downloadId:J

    aput-wide v6, v4, v5

    invoke-virtual {v3, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 261
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 262
    const-string v2, "title"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->name:Ljava/lang/String;

    .line 263
    iget-object v2, p1, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->path:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 264
    const-string v2, "local_uri"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "file://"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->path:Ljava/lang/String;

    .line 265
    :cond_0
    iget-object v2, p1, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->url:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 266
    const-string v2, "uri"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->url:Ljava/lang/String;

    .line 267
    :cond_1
    const-string v2, "media_type"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->type:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 271
    if-eqz v0, :cond_2

    .line 277
    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 285
    :cond_2
    :goto_0
    return-object p1

    .line 279
    :catch_0
    move-exception v1

    .line 281
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 270
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    .line 271
    if-eqz v0, :cond_3

    .line 277
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 284
    :cond_3
    :goto_1
    throw v2

    .line 279
    :catch_1
    move-exception v1

    .line 281
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v3, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 271
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4
    if-eqz v0, :cond_2

    .line 277
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 279
    :catch_2
    move-exception v1

    .line 281
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v2, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private queryDownloadStatus()V
    .locals 12
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v4, 0x1

    const/4 v7, 0x0

    const/16 v11, 0xe

    .line 178
    new-instance v2, Landroid/app/DownloadManager$Query;

    invoke-direct {v2}, Landroid/app/DownloadManager$Query;-><init>()V

    .line 179
    .local v2, "query":Landroid/app/DownloadManager$Query;
    new-array v4, v4, [J

    iget-object v5, p0, Lcom/boyaa/app/download/DownloadHandler;->mSP:Landroid/content/SharedPreferences;

    const-string v6, "downloadId"

    invoke-interface {v5, v6, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    aput-wide v5, v4, v7

    invoke-virtual {v2, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    .line 180
    const/4 v0, 0x0

    .line 182
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v4, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v4, v2}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 183
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 184
    const-string v4, "status"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 185
    .local v3, "status":I
    const-string v4, "uri"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    sparse-switch v3, :sswitch_data_0

    .line 210
    .end local v3    # "status":I
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 214
    :try_start_1
    sget-object v4, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-ge v4, v11, :cond_1

    .line 216
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 225
    :cond_1
    :goto_1
    return-void

    .line 188
    .restart local v3    # "status":I
    :sswitch_0
    :try_start_2
    const-string v4, "down"

    const-string v5, "STATUS_PAUSED"

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    :sswitch_1
    const-string v4, "down"

    const-string v5, "STATUS_PENDING"

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    :sswitch_2
    const-string v4, "down"

    const-string v5, "STATUS_RUNNING"

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 207
    .end local v3    # "status":I
    :catch_0
    move-exception v1

    .line 208
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    const-string v4, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 210
    if-eqz v0, :cond_1

    .line 214
    :try_start_4
    sget-object v4, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-ge v4, v11, :cond_1

    .line 216
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 218
    :catch_1
    move-exception v1

    .line 220
    const-string v4, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 197
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "status":I
    :sswitch_3
    :try_start_5
    const-string v4, "down"

    const-string v5, "\u4e0b\u8f7d\u5b8c\u6210"

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0

    .line 209
    .end local v3    # "status":I
    :catchall_0
    move-exception v4

    .line 210
    if-eqz v0, :cond_2

    .line 214
    :try_start_6
    sget-object v5, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    if-ge v5, v11, :cond_2

    .line 216
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 223
    :cond_2
    :goto_2
    throw v4

    .line 201
    .restart local v3    # "status":I
    :sswitch_4
    :try_start_7
    const-string v4, "down"

    const-string v5, "STATUS_FAILED"

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    iget-object v4, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadManager:Landroid/app/DownloadManager;

    const/4 v5, 0x1

    new-array v5, v5, [J

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/boyaa/app/download/DownloadHandler;->mSP:Landroid/content/SharedPreferences;

    const-string v8, "downloadId"

    const-wide/16 v9, 0x0

    invoke-interface {v7, v8, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    aput-wide v7, v5, v6

    invoke-virtual {v4, v5}, Landroid/app/DownloadManager;->remove([J)I

    .line 203
    iget-object v4, p0, Lcom/boyaa/app/download/DownloadHandler;->mSP:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0

    .line 218
    .end local v3    # "status":I
    :catch_2
    move-exception v1

    .line 220
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v5, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 218
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v1

    .line 220
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v4, "DownloadHandler"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 186
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x4 -> :sswitch_0
        0x8 -> :sswitch_3
        0x10 -> :sswitch_4
    .end sparse-switch
.end method

.method private regeisterReceiver()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 79
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 80
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 81
    const-string v1, "android.intent.action.DOWNLOAD_NOTIFICATION_CLICKED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 82
    const-string v1, "android.intent.action.VIEW_DOWNLOADS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 83
    iget-object v1, p0, Lcom/boyaa/app/download/DownloadHandler;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 84
    return-void
.end method

.method private static string2MD5(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "inStr"    # Ljava/lang/String;

    .prologue
    .line 231
    const/4 v5, 0x0

    .line 233
    .local v5, "md5":Ljava/security/MessageDigest;
    :try_start_0
    const-string v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 239
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 240
    .local v1, "charArray":[C
    array-length v8, v1

    new-array v0, v8, [B

    .line 242
    .local v0, "byteArray":[B
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, v1

    if-lt v4, v8, :cond_0

    .line 244
    invoke-virtual {v5, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v6

    .line 245
    .local v6, "md5Bytes":[B
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 246
    .local v3, "hexValue":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    :goto_1
    array-length v8, v6

    if-lt v4, v8, :cond_1

    .line 252
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .end local v0    # "byteArray":[B
    .end local v1    # "charArray":[C
    .end local v3    # "hexValue":Ljava/lang/StringBuffer;
    .end local v4    # "i":I
    .end local v6    # "md5Bytes":[B
    :goto_2
    return-object v8

    .line 234
    :catch_0
    move-exception v2

    .line 235
    .local v2, "e":Ljava/lang/Exception;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 236
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 237
    const-string v8, ""

    goto :goto_2

    .line 243
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "byteArray":[B
    .restart local v1    # "charArray":[C
    .restart local v4    # "i":I
    :cond_0
    aget-char v8, v1, v4

    int-to-byte v8, v8

    aput-byte v8, v0, v4

    .line 242
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 247
    .restart local v3    # "hexValue":Ljava/lang/StringBuffer;
    .restart local v6    # "md5Bytes":[B
    :cond_1
    aget-byte v8, v6, v4

    and-int/lit16 v7, v8, 0xff

    .line 248
    .local v7, "val":I
    const/16 v8, 0x10

    if-ge v7, v8, :cond_2

    .line 249
    const-string v8, "0"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 250
    :cond_2
    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 246
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method private unregeisterReceiver()V
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/boyaa/app/download/DownloadHandler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/boyaa/app/download/DownloadHandler;->mDownloadReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 95
    :cond_0
    return-void
.end method


# virtual methods
.method public exitDownload()V
    .locals 0

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/boyaa/app/download/DownloadHandler;->unregeisterReceiver()V

    .line 89
    return-void
.end method

.method public installApplication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 330
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mounted"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 346
    :cond_0
    :goto_0
    return v2

    .line 332
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 335
    const-string v3, "file://"

    const-string v4, ""

    invoke-virtual {p2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 336
    const-string v3, "wanpg"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u7a0b\u5e8f\u7684\u5730\u5740\uff1a"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 338
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 339
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 341
    .local v1, "intent":Landroid/content/Intent;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, p3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 342
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 343
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 344
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public setCompleteListener(Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;)V
    .locals 0
    .param p1, "completeListener"    # Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;

    .prologue
    .line 352
    iput-object p1, p0, Lcom/boyaa/app/download/DownloadHandler;->mCompleteListener:Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;

    .line 353
    return-void
.end method

.method public startDownload(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 98
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/boyaa/app/download/DownloadHandler;->startDownload(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method public startDownload(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/boyaa/app/download/DownloadHandler;->startDownload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    return-void
.end method

.method public startDownload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/boyaa/app/download/DownloadHandler;->startDownload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    return-void
.end method

.method public startDownload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "desc"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-boolean v1, p0, Lcom/boyaa/app/download/DownloadHandler;->isUseSysDownload:Z

    if-eqz v1, :cond_0

    .line 115
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/boyaa/app/download/DownloadHandler;->downloadBySystem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :goto_0
    return-void

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, "e":Ljava/lang/Exception;
    invoke-direct {p0, p1}, Lcom/boyaa/app/download/DownloadHandler;->downloadByBrowser(Ljava/lang/String;)V

    goto :goto_0

    .line 120
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    invoke-direct {p0, p1}, Lcom/boyaa/app/download/DownloadHandler;->downloadByBrowser(Ljava/lang/String;)V

    goto :goto_0
.end method
