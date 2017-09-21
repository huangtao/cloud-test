.class public Lcom/boyaa/app/file/ZipUtil;
.super Ljava/lang/Object;
.source "ZipUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ZipUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public Unzip(Ljava/io/InputStream;Ljava/lang/String;)Z
    .locals 16
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "unZipDir"    # Ljava/lang/String;

    .prologue
    .line 81
    const-string v14, "ZipUtil"

    const-string v15, "getUpdate zip : \u5f00\u59cb\u89e3\u538b"

    invoke-static {v14, v15}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const/16 v1, 0x2000

    .line 85
    .local v1, "BUFFER":I
    move-object/from16 v12, p2

    .line 87
    .local v12, "targetDir":Ljava/lang/String;
    const/4 v4, 0x0

    .line 89
    .local v4, "dest":Ljava/io/BufferedOutputStream;
    :try_start_0
    new-instance v13, Ljava/util/zip/ZipInputStream;

    .line 90
    new-instance v14, Ljava/io/BufferedInputStream;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 89
    invoke-direct {v13, v14}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .local v13, "zis":Ljava/util/zip/ZipInputStream;
    move-object v5, v4

    .line 93
    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .local v5, "dest":Ljava/io/BufferedOutputStream;
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v13}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v7

    .local v7, "entry":Ljava/util/zip/ZipEntry;
    if-nez v7, :cond_1

    .line 127
    invoke-virtual {v13}, Ljava/util/zip/ZipInputStream;->close()V

    .line 128
    const-string v14, "ZipUtil"

    const-string v15, "getUpdate zip : \u89e3\u538b\u6210\u529f"

    invoke-static {v14, v15}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    const/4 v14, 0x1

    move-object v4, v5

    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .end local v7    # "entry":Ljava/util/zip/ZipEntry;
    .end local v13    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    :goto_1
    return v14

    .line 95
    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v7    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v13    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_1
    new-array v3, v1, [B

    .line 96
    .local v3, "data":[B
    invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v11

    .line 97
    .local v11, "strEntry":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v14

    if-nez v14, :cond_0

    .line 102
    new-instance v9, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v9, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 103
    .local v9, "entryFile":Ljava/io/File;
    new-instance v8, Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v8, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 105
    .local v8, "entryDir":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_2

    .line 107
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 111
    :cond_2
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_3

    .line 113
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 115
    :cond_3
    invoke-virtual {v9}, Ljava/io/File;->createNewFile()Z

    .line 118
    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 119
    .local v10, "fos":Ljava/io/FileOutputStream;
    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-direct {v4, v10, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 121
    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    :goto_2
    const/4 v14, 0x0

    :try_start_2
    invoke-virtual {v13, v3, v14, v1}, Ljava/util/zip/ZipInputStream;->read([BII)I

    move-result v2

    .local v2, "count":I
    const/4 v14, -0x1

    if-ne v2, v14, :cond_4

    .line 124
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->flush()V

    .line 125
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V

    move-object v5, v4

    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_0

    .line 122
    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    :cond_4
    const/4 v14, 0x0

    invoke-virtual {v4, v3, v14, v2}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 129
    .end local v2    # "count":I
    .end local v3    # "data":[B
    .end local v7    # "entry":Ljava/util/zip/ZipEntry;
    .end local v8    # "entryDir":Ljava/io/File;
    .end local v9    # "entryFile":Ljava/io/File;
    .end local v10    # "fos":Ljava/io/FileOutputStream;
    .end local v11    # "strEntry":Ljava/lang/String;
    .end local v13    # "zis":Ljava/util/zip/ZipInputStream;
    :catch_0
    move-exception v6

    .line 130
    .local v6, "e":Ljava/io/FileNotFoundException;
    :goto_3
    const-string v14, "ZipUtil"

    invoke-virtual {v6}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const/4 v14, 0x0

    goto :goto_1

    .line 132
    .end local v6    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v6

    .line 133
    .local v6, "e":Ljava/lang/Exception;
    :goto_4
    const-string v14, "ZipUtil"

    invoke-virtual {v6}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    const/4 v14, 0x0

    goto :goto_1

    .line 132
    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v13    # "zis":Ljava/util/zip/ZipInputStream;
    :catch_2
    move-exception v6

    move-object v4, v5

    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_4

    .line 129
    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    :catch_3
    move-exception v6

    move-object v4, v5

    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_3
.end method

.method public Unzip(Ljava/lang/String;)Z
    .locals 20
    .param p1, "zipFile"    # Ljava/lang/String;

    .prologue
    .line 25
    const-string v17, "ZipUtil"

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "getUpdate zip :"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " \u5f00\u59cb\u89e3\u538b"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    const/16 v2, 0x1000

    .line 28
    .local v2, "BUFFER":I
    const-string v17, "/"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v13

    .line 29
    .local v13, "lastIndex":I
    const-string v15, ""

    .line 30
    .local v15, "targetDir":Ljava/lang/String;
    const/16 v17, 0x1

    move/from16 v0, v17

    if-eq v13, v0, :cond_1

    .line 31
    new-instance v17, Ljava/lang/StringBuilder;

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 36
    const/4 v5, 0x0

    .line 40
    .local v5, "dest":Ljava/io/BufferedOutputStream;
    :try_start_0
    new-instance v11, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 41
    .local v11, "fis":Ljava/io/FileInputStream;
    new-instance v16, Ljava/util/zip/ZipInputStream;

    .line 42
    new-instance v17, Ljava/io/BufferedInputStream;

    move-object/from16 v0, v17

    invoke-direct {v0, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 41
    invoke-direct/range {v16 .. v17}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .local v16, "zis":Ljava/util/zip/ZipInputStream;
    move-object v6, v5

    .line 45
    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .local v6, "dest":Ljava/io/BufferedOutputStream;
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual/range {v16 .. v16}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v8

    .local v8, "entry":Ljava/util/zip/ZipEntry;
    if-nez v8, :cond_2

    .line 66
    invoke-virtual/range {v16 .. v16}, Ljava/util/zip/ZipInputStream;->close()V

    .line 67
    const-string v17, "ZipUtil"

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "getUpdate zip :"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " \u89e3\u538b\u6210\u529f"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    const/16 v17, 0x1

    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .end local v8    # "entry":Ljava/util/zip/ZipEntry;
    .end local v11    # "fis":Ljava/io/FileInputStream;
    .end local v16    # "zis":Ljava/util/zip/ZipInputStream;
    :goto_1
    return v17

    .line 33
    :cond_1
    const/16 v17, 0x0

    goto :goto_1

    .line 47
    .restart local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v8    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v16    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_2
    new-array v4, v2, [B

    .line 48
    .local v4, "data":[B
    invoke-virtual {v8}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v14

    .line 50
    .local v14, "strEntry":Ljava/lang/String;
    new-instance v10, Ljava/io/File;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v10, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 51
    .local v10, "entryFile":Ljava/io/File;
    new-instance v9, Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 52
    .local v9, "entryDir":Ljava/io/File;
    invoke-virtual {v8}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v17

    if-nez v17, :cond_0

    .line 54
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v17

    if-nez v17, :cond_3

    .line 55
    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    .line 57
    :cond_3
    new-instance v12, Ljava/io/FileOutputStream;

    invoke-direct {v12, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 58
    .local v12, "fos":Ljava/io/FileOutputStream;
    new-instance v5, Ljava/io/BufferedOutputStream;

    invoke-direct {v5, v12, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 60
    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    :goto_2
    const/16 v17, 0x0

    :try_start_2
    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v0, v4, v1, v2}, Ljava/util/zip/ZipInputStream;->read([BII)I

    move-result v3

    .local v3, "count":I
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v3, v0, :cond_4

    .line 63
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V

    .line 64
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    move-object v6, v5

    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v6    # "dest":Ljava/io/BufferedOutputStream;
    goto/16 :goto_0

    .line 61
    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    :cond_4
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v4, v0, v3}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 68
    .end local v3    # "count":I
    .end local v4    # "data":[B
    .end local v8    # "entry":Ljava/util/zip/ZipEntry;
    .end local v9    # "entryDir":Ljava/io/File;
    .end local v10    # "entryFile":Ljava/io/File;
    .end local v11    # "fis":Ljava/io/FileInputStream;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .end local v14    # "strEntry":Ljava/lang/String;
    .end local v16    # "zis":Ljava/util/zip/ZipInputStream;
    :catch_0
    move-exception v7

    .line 69
    .local v7, "e":Ljava/io/FileNotFoundException;
    :goto_3
    const-string v17, "ZipUtil"

    invoke-virtual {v7}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const/16 v17, 0x0

    goto :goto_1

    .line 71
    .end local v7    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v7

    .line 72
    .local v7, "e":Ljava/io/IOException;
    :goto_4
    const-string v17, "ZipUtil"

    invoke-virtual {v7}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    const/16 v17, 0x0

    goto/16 :goto_1

    .line 71
    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v16    # "zis":Ljava/util/zip/ZipInputStream;
    :catch_2
    move-exception v7

    move-object v5, v6

    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_4

    .line 68
    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v6    # "dest":Ljava/io/BufferedOutputStream;
    :catch_3
    move-exception v7

    move-object v5, v6

    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_3
.end method

.method public deleteOlderFiles()V
    .locals 18

    .prologue
    .line 175
    const/4 v11, 0x2

    new-array v5, v11, [Ljava/lang/String;

    const/4 v11, 0x0

    const-string v12, "scripts"

    aput-object v12, v5, v11

    const/4 v11, 0x1

    const-string v12, "images"

    aput-object v12, v5, v11

    .line 176
    .local v5, "folderNames":[Ljava/lang/String;
    array-length v14, v5

    const/4 v11, 0x0

    move v13, v11

    :goto_0
    if-lt v13, v14, :cond_0

    .line 195
    return-void

    .line 176
    :cond_0
    aget-object v4, v5, v13

    .line 177
    .local v4, "folderName":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    sget-object v12, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v12}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v12

    invoke-virtual {v12}, Landroid/app/Application;->getFilesDir()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v12, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "update"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-object v12, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-object v12, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 178
    .local v9, "path":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 179
    .local v3, "folder":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 180
    .local v2, "files":[Ljava/io/File;
    array-length v15, v2

    const/4 v11, 0x0

    move v12, v11

    :goto_1
    if-lt v12, v15, :cond_1

    .line 176
    add-int/lit8 v11, v13, 0x1

    move v13, v11

    goto :goto_0

    .line 180
    :cond_1
    aget-object v10, v2, v12

    .line 181
    .local v10, "subFile":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 182
    .local v1, "fileName":Ljava/lang/String;
    const-string v11, "games"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 183
    invoke-virtual {v10}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v8

    .line 184
    .local v8, "gameFiles":[Ljava/io/File;
    array-length v0, v8

    move/from16 v16, v0

    const/4 v11, 0x0

    :goto_2
    move/from16 v0, v16

    if-lt v11, v0, :cond_2

    .line 180
    .end local v8    # "gameFiles":[Ljava/io/File;
    :goto_3
    add-int/lit8 v11, v12, 0x1

    move v12, v11

    goto :goto_1

    .line 184
    .restart local v8    # "gameFiles":[Ljava/io/File;
    :cond_2
    aget-object v6, v8, v11

    .line 185
    .local v6, "gameFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    .line 186
    .local v7, "gameFileName":Ljava/lang/String;
    const-string v17, "common"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "common2"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 187
    :cond_3
    invoke-static {v6}, Lcom/boyaa/app/file/FileUtil;->deleteDirectory(Ljava/io/File;)V

    .line 184
    :cond_4
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 191
    .end local v6    # "gameFile":Ljava/io/File;
    .end local v7    # "gameFileName":Ljava/lang/String;
    .end local v8    # "gameFiles":[Ljava/io/File;
    :cond_5
    invoke-static {v10}, Lcom/boyaa/app/file/FileUtil;->deleteDirectory(Ljava/io/File;)V

    goto :goto_3
.end method

.method public zipFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "zipFilePath"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 142
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 145
    .local v4, "file":Ljava/io/File;
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 146
    .local v5, "fis":Ljava/io/FileInputStream;
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 147
    .local v0, "bis":Ljava/io/BufferedInputStream;
    const/16 v11, 0x400

    new-array v2, v11, [B

    .line 149
    .local v2, "buf":[B
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 150
    .local v6, "fos":Ljava/io/FileOutputStream;
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-direct {v1, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 151
    .local v1, "bos":Ljava/io/BufferedOutputStream;
    new-instance v9, Ljava/util/zip/ZipOutputStream;

    invoke-direct {v9, v1}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 152
    .local v9, "zos":Ljava/util/zip/ZipOutputStream;
    new-instance v8, Ljava/util/zip/ZipEntry;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v11}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 153
    .local v8, "ze":Ljava/util/zip/ZipEntry;
    invoke-virtual {v9, v8}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 154
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v7

    .local v7, "len":I
    const/4 v11, -0x1

    if-ne v7, v11, :cond_0

    .line 158
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 159
    invoke-virtual {v9}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 167
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .end local v2    # "buf":[B
    .end local v5    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "len":I
    .end local v8    # "ze":Ljava/util/zip/ZipEntry;
    .end local v9    # "zos":Ljava/util/zip/ZipOutputStream;
    .end local p2    # "zipFilePath":Ljava/lang/String;
    :goto_1
    return-object p2

    .line 155
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v2    # "buf":[B
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v6    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "len":I
    .restart local v8    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v9    # "zos":Ljava/util/zip/ZipOutputStream;
    .restart local p2    # "zipFilePath":Ljava/lang/String;
    :cond_0
    const/4 v11, 0x0

    invoke-virtual {v9, v2, v11, v7}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    .line 156
    invoke-virtual {v9}, Ljava/util/zip/ZipOutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 160
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .end local v2    # "buf":[B
    .end local v5    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "len":I
    .end local v8    # "ze":Ljava/util/zip/ZipEntry;
    .end local v9    # "zos":Ljava/util/zip/ZipOutputStream;
    :catch_0
    move-exception v3

    .line 161
    .local v3, "e":Ljava/io/FileNotFoundException;
    const-string v11, "ZipUtil"

    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    move-object p2, v10

    .line 162
    goto :goto_1

    .line 163
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v3

    .line 164
    .local v3, "e":Ljava/io/IOException;
    const-string v11, "ZipUtil"

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    move-object p2, v10

    .line 165
    goto :goto_1
.end method
