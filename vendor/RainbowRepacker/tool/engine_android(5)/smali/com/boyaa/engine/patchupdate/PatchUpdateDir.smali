.class public Lcom/boyaa/engine/patchupdate/PatchUpdateDir;
.super Ljava/lang/Object;
.source "PatchUpdateDir.java"


# static fields
.field private static final ONE_WEEK_MILLIS:J = 0x240c8400L

.field private static final kdirPath:Ljava/lang/String; = "dirPath"

.field private static final kstrDictName:Ljava/lang/String; = "patchUpdate"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createDir()V
    .locals 4

    .prologue
    .line 22
    const-string v2, "patchUpdate"

    const-string v3, "dirPath"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 23
    .local v1, "patchDirPath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 25
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 29
    :goto_0
    return-void

    .line 27
    :cond_0
    invoke-static {v0}, Lcom/boyaa/engine/patchupdate/PatchUpdateDir;->delFileOneWeekAgo(Ljava/io/File;)V

    goto :goto_0
.end method

.method private static delFileOneWeekAgo(Ljava/io/File;)V
    .locals 11
    .param p0, "folder"    # Ljava/io/File;

    .prologue
    .line 33
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 34
    .local v4, "files":[Ljava/io/File;
    if-eqz v4, :cond_1

    .line 35
    move-object v2, v4

    .local v2, "arr$":[Ljava/io/File;
    array-length v6, v2

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_1

    aget-object v3, v2, v5

    .line 38
    .local v3, "file":Ljava/io/File;
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 39
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v9

    sub-long v0, v7, v9

    .line 40
    .local v0, "afterModified":J
    const-wide/32 v7, 0x240c8400

    cmp-long v7, v0, v7

    if-lez v7, :cond_0

    .line 41
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .end local v0    # "afterModified":J
    :cond_0
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 48
    .end local v2    # "arr$":[Ljava/io/File;
    .end local v3    # "file":Ljava/io/File;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_1
    return-void

    .line 44
    .restart local v2    # "arr$":[Ljava/io/File;
    .restart local v3    # "file":Ljava/io/File;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    :catch_0
    move-exception v7

    goto :goto_1
.end method
