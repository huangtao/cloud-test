.class public Lcom/boyaa/engine/common/ExternalStorage;
.super Ljava/lang/Object;
.source "ExternalStorage.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ExternalStorage"

.field private static isFirstRun:Z

.field private static storageRoot:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    invoke-static {}, Lcom/boyaa/engine/common/ExternalStorage;->getStorageUserRoot()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    .line 22
    invoke-static {}, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun()Z

    move-result v0

    sput-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearDirWhenAppInstall(Ljava/lang/String;)V
    .locals 2
    .param p0, "dirName"    # Ljava/lang/String;

    .prologue
    .line 181
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 184
    :cond_0
    return-void
.end method

.method public static clearStorageAudioWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 84
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 87
    :cond_0
    return-void
.end method

.method public static clearStorageDicWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 104
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "dic"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 107
    :cond_0
    return-void
.end method

.method public static clearStorageDictWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 114
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "dict"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 117
    :cond_0
    return-void
.end method

.method public static clearStorageFontsWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 94
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "fonts"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 97
    :cond_0
    return-void
.end method

.method public static clearStorageImagesWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 155
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 156
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "images"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 158
    :cond_0
    return-void
.end method

.method public static clearStorageLogWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 124
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "log"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 127
    :cond_0
    return-void
.end method

.method public static clearStorageScriptsWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 74
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "scripts"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 77
    :cond_0
    return-void
.end method

.method public static clearStorageTempWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 134
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "temp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "tmp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 138
    :cond_0
    return-void
.end method

.method public static clearStorageUpdateWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 165
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "update"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 168
    :cond_0
    return-void
.end method

.method public static clearStorageUserWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 145
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "user"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 148
    :cond_0
    return-void
.end method

.method public static clearStorageXmlWhenAppInstall(Z)V
    .locals 2
    .param p0, "isClear"    # Z

    .prologue
    .line 175
    sget-boolean v0, Lcom/boyaa/engine/common/ExternalStorage;->isFirstRun:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->deleteDir(Ljava/lang/String;)V

    .line 178
    :cond_0
    return-void
.end method

.method private static deleteDir(Ljava/lang/String;)V
    .locals 4
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 48
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 49
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 50
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 51
    .local v1, "files":[Ljava/io/File;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 52
    aget-object v3, v1, v2

    invoke-static {v3}, Lcom/boyaa/engine/common/ExternalStorage;->doDeleteDir(Ljava/io/File;)V

    .line 51
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 55
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method private static doDeleteDir(Ljava/io/File;)V
    .locals 3
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 58
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 67
    :goto_0
    return-void

    .line 60
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 61
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 62
    .local v0, "files":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 63
    aget-object v2, v0, v1

    invoke-static {v2}, Lcom/boyaa/engine/common/ExternalStorage;->doDeleteDir(Ljava/io/File;)V

    .line 62
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 66
    .end local v0    # "files":[Ljava/io/File;
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto :goto_0
.end method

.method private static getLastVersionCode()I
    .locals 10

    .prologue
    .line 189
    new-instance v3, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".version_code"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 190
    .local v3, "file":Ljava/io/File;
    const/4 v4, 0x0

    .line 191
    .local v4, "fr":Ljava/io/FileReader;
    const/4 v0, 0x0

    .line 192
    .local v0, "br":Ljava/io/BufferedReader;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 194
    :try_start_0
    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    .end local v4    # "fr":Ljava/io/FileReader;
    .local v5, "fr":Ljava/io/FileReader;
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 196
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 197
    .local v6, "line":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_8
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v7

    .line 201
    if-eqz v5, :cond_0

    .line 203
    :try_start_3
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 209
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    .line 211
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    :cond_1
    :goto_1
    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v4, v5

    .line 218
    .end local v5    # "fr":Ljava/io/FileReader;
    .end local v6    # "line":Ljava/lang/String;
    .restart local v4    # "fr":Ljava/io/FileReader;
    :goto_2
    return v7

    .line 204
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "fr":Ljava/io/FileReader;
    .restart local v6    # "line":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 205
    .local v2, "e":Ljava/io/IOException;
    const-string v8, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 212
    .end local v2    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 213
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v8, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 198
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v5    # "fr":Ljava/io/FileReader;
    .end local v6    # "line":Ljava/lang/String;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    :catch_2
    move-exception v2

    .line 199
    .local v2, "e":Ljava/lang/Exception;
    :goto_3
    :try_start_5
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 201
    if-eqz v4, :cond_2

    .line 203
    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 209
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    :goto_4
    if-eqz v0, :cond_3

    .line 211
    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 218
    :cond_3
    :goto_5
    const/4 v7, 0x0

    goto :goto_2

    .line 204
    .restart local v2    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v2

    .line 205
    .local v2, "e":Ljava/io/IOException;
    const-string v7, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 212
    .end local v2    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v2

    .line 213
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v7, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 201
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    :goto_6
    if-eqz v4, :cond_4

    .line 203
    :try_start_8
    invoke-virtual {v4}, Ljava/io/FileReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 209
    :cond_4
    :goto_7
    if-eqz v0, :cond_5

    .line 211
    :try_start_9
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 214
    :cond_5
    :goto_8
    throw v7

    .line 204
    :catch_5
    move-exception v2

    .line 205
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v8, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 212
    .end local v2    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v2

    .line 213
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v8, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    .line 201
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v5    # "fr":Ljava/io/FileReader;
    :catchall_1
    move-exception v7

    move-object v4, v5

    .end local v5    # "fr":Ljava/io/FileReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    goto :goto_6

    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "fr":Ljava/io/FileReader;
    :catchall_2
    move-exception v7

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v4, v5

    .end local v5    # "fr":Ljava/io/FileReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    goto :goto_6

    .line 198
    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v5    # "fr":Ljava/io/FileReader;
    :catch_7
    move-exception v2

    move-object v4, v5

    .end local v5    # "fr":Ljava/io/FileReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    goto :goto_3

    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "fr":Ljava/io/FileReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "fr":Ljava/io/FileReader;
    :catch_8
    move-exception v2

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v4, v5

    .end local v5    # "fr":Ljava/io/FileReader;
    .restart local v4    # "fr":Ljava/io/FileReader;
    goto :goto_3
.end method

.method private static getStorageUserRoot()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    const-string v0, "storage_outer_root"

    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static isFirstRun()Z
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 30
    :try_start_0
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/boyaa/engine/made/AppActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 31
    .local v4, "pkgName":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/boyaa/engine/made/AppActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v4, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 32
    .local v2, "info":Landroid/content/pm/PackageInfo;
    iget v0, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 33
    .local v0, "currentVersion":I
    invoke-static {}, Lcom/boyaa/engine/common/ExternalStorage;->getLastVersionCode()I

    move-result v3

    .line 34
    .local v3, "lastVersion":I
    if-eq v0, v3, :cond_0

    .line 35
    invoke-static {v0}, Lcom/boyaa/engine/common/ExternalStorage;->setCurrentVersionCode(I)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    const/4 v5, 0x1

    .line 41
    .end local v0    # "currentVersion":I
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    .end local v3    # "lastVersion":I
    :cond_0
    :goto_0
    return v5

    .line 39
    :catch_0
    move-exception v1

    .line 40
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method private static setCurrentVersionCode(I)V
    .locals 9
    .param p0, "code"    # I

    .prologue
    .line 223
    new-instance v3, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/boyaa/engine/common/ExternalStorage;->storageRoot:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".version_code"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 224
    .local v3, "file":Ljava/io/File;
    const/4 v4, 0x0

    .line 225
    .local v4, "fw":Ljava/io/FileWriter;
    const/4 v0, 0x0

    .line 227
    .local v0, "bw":Ljava/io/BufferedWriter;
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    .line 228
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 230
    :cond_0
    new-instance v5, Ljava/io/FileWriter;

    invoke-direct {v5, v3}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 231
    .end local v4    # "fw":Ljava/io/FileWriter;
    .local v5, "fw":Ljava/io/FileWriter;
    :try_start_1
    new-instance v1, Ljava/io/BufferedWriter;

    invoke-direct {v1, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 232
    .end local v0    # "bw":Ljava/io/BufferedWriter;
    .local v1, "bw":Ljava/io/BufferedWriter;
    :try_start_2
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 233
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->flush()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_8
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 237
    if-eqz v5, :cond_1

    .line 239
    :try_start_3
    invoke-virtual {v5}, Ljava/io/FileWriter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 245
    :cond_1
    :goto_0
    if-eqz v1, :cond_6

    .line 247
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    move-object v0, v1

    .end local v1    # "bw":Ljava/io/BufferedWriter;
    .restart local v0    # "bw":Ljava/io/BufferedWriter;
    move-object v4, v5

    .line 253
    .end local v5    # "fw":Ljava/io/FileWriter;
    .restart local v4    # "fw":Ljava/io/FileWriter;
    :cond_2
    :goto_1
    return-void

    .line 240
    .end local v0    # "bw":Ljava/io/BufferedWriter;
    .end local v4    # "fw":Ljava/io/FileWriter;
    .restart local v1    # "bw":Ljava/io/BufferedWriter;
    .restart local v5    # "fw":Ljava/io/FileWriter;
    :catch_0
    move-exception v2

    .line 241
    .local v2, "e":Ljava/io/IOException;
    const-string v6, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 248
    .end local v2    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 249
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v6, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .end local v1    # "bw":Ljava/io/BufferedWriter;
    .restart local v0    # "bw":Ljava/io/BufferedWriter;
    move-object v4, v5

    .line 250
    .end local v5    # "fw":Ljava/io/FileWriter;
    .restart local v4    # "fw":Ljava/io/FileWriter;
    goto :goto_1

    .line 234
    .end local v2    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v2

    .line 235
    .local v2, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_5
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 237
    if-eqz v4, :cond_3

    .line 239
    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileWriter;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 245
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3
    :goto_3
    if-eqz v0, :cond_2

    .line 247
    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_1

    .line 248
    :catch_3
    move-exception v2

    .line 249
    .local v2, "e":Ljava/io/IOException;
    const-string v6, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 240
    .local v2, "e":Ljava/lang/Exception;
    :catch_4
    move-exception v2

    .line 241
    .local v2, "e":Ljava/io/IOException;
    const-string v6, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 237
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :goto_4
    if-eqz v4, :cond_4

    .line 239
    :try_start_8
    invoke-virtual {v4}, Ljava/io/FileWriter;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 245
    :cond_4
    :goto_5
    if-eqz v0, :cond_5

    .line 247
    :try_start_9
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 250
    :cond_5
    :goto_6
    throw v6

    .line 240
    :catch_5
    move-exception v2

    .line 241
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v7, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 248
    .end local v2    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v2

    .line 249
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v7, "ExternalStorage"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 237
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "fw":Ljava/io/FileWriter;
    .restart local v5    # "fw":Ljava/io/FileWriter;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "fw":Ljava/io/FileWriter;
    .restart local v4    # "fw":Ljava/io/FileWriter;
    goto :goto_4

    .end local v0    # "bw":Ljava/io/BufferedWriter;
    .end local v4    # "fw":Ljava/io/FileWriter;
    .restart local v1    # "bw":Ljava/io/BufferedWriter;
    .restart local v5    # "fw":Ljava/io/FileWriter;
    :catchall_2
    move-exception v6

    move-object v0, v1

    .end local v1    # "bw":Ljava/io/BufferedWriter;
    .restart local v0    # "bw":Ljava/io/BufferedWriter;
    move-object v4, v5

    .end local v5    # "fw":Ljava/io/FileWriter;
    .restart local v4    # "fw":Ljava/io/FileWriter;
    goto :goto_4

    .line 234
    .end local v4    # "fw":Ljava/io/FileWriter;
    .restart local v5    # "fw":Ljava/io/FileWriter;
    :catch_7
    move-exception v2

    move-object v4, v5

    .end local v5    # "fw":Ljava/io/FileWriter;
    .restart local v4    # "fw":Ljava/io/FileWriter;
    goto :goto_2

    .end local v0    # "bw":Ljava/io/BufferedWriter;
    .end local v4    # "fw":Ljava/io/FileWriter;
    .restart local v1    # "bw":Ljava/io/BufferedWriter;
    .restart local v5    # "fw":Ljava/io/FileWriter;
    :catch_8
    move-exception v2

    move-object v0, v1

    .end local v1    # "bw":Ljava/io/BufferedWriter;
    .restart local v0    # "bw":Ljava/io/BufferedWriter;
    move-object v4, v5

    .end local v5    # "fw":Ljava/io/FileWriter;
    .restart local v4    # "fw":Ljava/io/FileWriter;
    goto :goto_2

    .end local v0    # "bw":Ljava/io/BufferedWriter;
    .end local v4    # "fw":Ljava/io/FileWriter;
    .restart local v1    # "bw":Ljava/io/BufferedWriter;
    .restart local v5    # "fw":Ljava/io/FileWriter;
    :cond_6
    move-object v0, v1

    .end local v1    # "bw":Ljava/io/BufferedWriter;
    .restart local v0    # "bw":Ljava/io/BufferedWriter;
    move-object v4, v5

    .end local v5    # "fw":Ljava/io/FileWriter;
    .restart local v4    # "fw":Ljava/io/FileWriter;
    goto :goto_1
.end method
