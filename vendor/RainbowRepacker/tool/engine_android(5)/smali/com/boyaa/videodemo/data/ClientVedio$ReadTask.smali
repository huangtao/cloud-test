.class Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;
.super Ljava/lang/Object;
.source "ClientVedio.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/data/ClientVedio;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReadTask"
.end annotation


# instance fields
.field public mInStream:Ljava/io/InputStream;

.field private mIsRead:Z

.field private mListener:Lcom/boyaa/videodemo/listener/TaskListener;

.field private mSocket:Ljava/net/Socket;

.field private receiveBuffer:[B

.field final synthetic this$0:Lcom/boyaa/videodemo/data/ClientVedio;


# direct methods
.method public constructor <init>(Lcom/boyaa/videodemo/data/ClientVedio;Ljava/net/Socket;Lcom/boyaa/videodemo/listener/TaskListener;)V
    .locals 3
    .param p2, "socket"    # Ljava/net/Socket;
    .param p3, "listener"    # Lcom/boyaa/videodemo/listener/TaskListener;

    .prologue
    .line 272
    iput-object p1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->this$0:Lcom/boyaa/videodemo/data/ClientVedio;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 267
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mInStream:Ljava/io/InputStream;

    .line 273
    iput-object p2, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mSocket:Ljava/net/Socket;

    .line 274
    iput-object p3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    .line 277
    const/16 v1, 0x400

    :try_start_0
    new-array v1, v1, [B

    iput-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    .line 278
    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mInStream:Ljava/io/InputStream;

    if-nez v1, :cond_0

    .line 279
    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mSocket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mInStream:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 290
    :cond_0
    :goto_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mIsRead:Z

    .line 292
    return-void

    .line 282
    :catch_0
    move-exception v0

    .line 284
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 285
    const-string v1, "ClientAudio"

    const-string v2, "\u63a7\u5236\u8fde\u63a5\u65ad\u7ebf \u9700\u8981\u91cd\u65b0\u8fde\u63a5"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    const/4 v2, 0x2

    invoke-interface {v1, v0, v2}, Lcom/boyaa/videodemo/listener/TaskListener;->failed(Ljava/lang/Exception;I)V

    .line 287
    const/4 v1, 0x0

    sput-boolean v1, Lcom/boyaa/videodemo/utils/Constants;->isOnRecontentAccess:Z

    goto :goto_0
.end method


# virtual methods
.method public release()V
    .locals 2

    .prologue
    .line 424
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mIsRead:Z

    .line 425
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lcom/boyaa/videodemo/listener/TaskListener;->release(I)V

    .line 426
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mInStream:Ljava/io/InputStream;

    invoke-static {v0}, Lcom/boyaa/videodemo/utils/StreamUtils;->closeInputStream(Ljava/io/InputStream;)Z

    .line 427
    const-string v0, "ClientAudio"

    const-string v1, "ReadTask release"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    return-void
.end method

.method public run()V
    .locals 15

    .prologue
    const/4 v14, 0x0

    .line 297
    :cond_0
    :goto_0
    :try_start_0
    iget-boolean v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mIsRead:Z

    if-nez v10, :cond_2

    .line 421
    :cond_1
    :goto_1
    return-void

    .line 298
    :cond_2
    const/4 v6, 0x0

    .line 300
    .local v6, "iReadSize":I
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mInStream:Ljava/io/InputStream;

    iget-object v11, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    invoke-virtual {v10, v11}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .line 302
    if-lez v6, :cond_0

    .line 304
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getDataFin()Z

    move-result v10

    if-nez v10, :cond_5

    .line 306
    const/4 v4, 0x0

    .line 307
    .local v4, "iPackageLength":I
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    const/4 v11, 0x0

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v4

    .line 308
    const-string v10, "Read Data"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "000   PackageLen = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    add-int/lit8 v5, v4, -0x4

    .line 311
    .local v5, "iProLen":I
    if-lez v5, :cond_3

    if-ne v4, v6, :cond_3

    .line 313
    const-string v10, "Read Data"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "001 Read iSize = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  PackageLen = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    new-array v9, v5, [B

    .line 316
    .local v9, "packData":[B
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    const/4 v11, 0x4

    const/4 v12, 0x0

    invoke-static {v10, v11, v9, v12, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 318
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-interface {v10, v9}, Lcom/boyaa/videodemo/listener/TaskListener;->success([B)V

    .line 319
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 412
    .end local v4    # "iPackageLength":I
    .end local v5    # "iProLen":I
    .end local v6    # "iReadSize":I
    .end local v9    # "packData":[B
    :catch_0
    move-exception v3

    .line 413
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 414
    sget-boolean v10, Lcom/boyaa/videodemo/utils/Constants;->loginRoom:Z

    if-eqz v10, :cond_1

    .line 416
    const-string v10, "ClientAudio"

    const-string v11, "\u63a7\u5236\u8fde\u63a5\u65ad\u7ebf \u9700\u8981\u91cd\u65b0\u8fde\u63a5"

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    const/4 v11, 0x2

    invoke-interface {v10, v3, v11}, Lcom/boyaa/videodemo/listener/TaskListener;->failed(Ljava/lang/Exception;I)V

    .line 418
    sput-boolean v14, Lcom/boyaa/videodemo/utils/Constants;->isOnRecontentAccess:Z

    goto/16 :goto_1

    .line 321
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v4    # "iPackageLength":I
    .restart local v5    # "iProLen":I
    .restart local v6    # "iReadSize":I
    :cond_3
    if-lez v4, :cond_4

    if-ge v4, v6, :cond_4

    .line 323
    :try_start_1
    const-string v10, "Read Data"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "002 Read iSize = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  PackageLen = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    new-array v9, v5, [B

    .line 326
    .restart local v9    # "packData":[B
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    const/4 v11, 0x4

    const/4 v12, 0x0

    invoke-static {v10, v11, v9, v12, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 327
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-interface {v10, v9}, Lcom/boyaa/videodemo/listener/TaskListener;->success([B)V

    .line 328
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 330
    sub-int v10, v6, v4

    new-array v8, v10, [B

    .line 331
    .local v8, "leftData":[B
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    const/4 v11, 0x0

    sub-int v12, v6, v4

    invoke-static {v10, v4, v8, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 333
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->this$0:Lcom/boyaa/videodemo/data/ClientVedio;

    iget-object v11, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-virtual {v10, v8, v11}, Lcom/boyaa/videodemo/data/ClientVedio;->DealLeftData([BLcom/boyaa/videodemo/listener/TaskListener;)V

    goto/16 :goto_0

    .line 336
    .end local v8    # "leftData":[B
    .end local v9    # "packData":[B
    :cond_4
    if-lez v4, :cond_0

    if-le v4, v6, :cond_0

    .line 339
    const-string v10, "Read Data"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "003 Read iSize = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  PackageLen = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 342
    add-int/lit8 v10, v6, -0x4

    new-array v8, v10, [B

    .line 343
    .restart local v8    # "leftData":[B
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    const/4 v11, 0x4

    const/4 v12, 0x0

    add-int/lit8 v13, v6, -0x4

    invoke-static {v10, v11, v8, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 344
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setData([B)V

    .line 345
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataLength(I)V

    goto/16 :goto_0

    .line 350
    .end local v4    # "iPackageLength":I
    .end local v5    # "iProLen":I
    .end local v8    # "leftData":[B
    :cond_5
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getDataLength()I

    move-result v10

    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v11

    invoke-virtual {v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v11

    array-length v11, v11

    sub-int/2addr v10, v11

    add-int/lit8 v7, v10, -0x4

    .line 352
    .local v7, "iRemain":I
    if-gez v7, :cond_6

    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getDataLength()I

    move-result v10

    if-nez v10, :cond_6

    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v10

    array-length v10, v10

    if-lez v10, :cond_6

    .line 354
    const-string v10, "Read Data"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "110 Read iSize = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  iRemain = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 356
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v10

    array-length v10, v10

    add-int/2addr v10, v6

    new-array v0, v10, [B

    .line 357
    .local v0, "dataAppend":[B
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v10

    iget-object v11, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/ByteUtils;->append([B[B)[B

    move-result-object v0

    .line 358
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->this$0:Lcom/boyaa/videodemo/data/ClientVedio;

    iget-object v11, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-virtual {v10, v0, v11}, Lcom/boyaa/videodemo/data/ClientVedio;->DealLeftData([BLcom/boyaa/videodemo/listener/TaskListener;)V

    goto/16 :goto_0

    .line 360
    .end local v0    # "dataAppend":[B
    :cond_6
    const/16 v10, 0x2800

    if-le v7, v10, :cond_7

    .line 362
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    goto/16 :goto_0

    .line 366
    :cond_7
    if-ne v7, v6, :cond_8

    .line 368
    const-string v10, "Read Data"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "121 Read iSize = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  iRemain = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    new-array v2, v7, [B

    .line 371
    .local v2, "dataRemain":[B
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v10, v11, v2, v12, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 372
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v11

    invoke-virtual {v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v11

    invoke-static {v11, v2}, Lcom/boyaa/videodemo/utils/ByteUtils;->append([B[B)[B

    move-result-object v11

    invoke-interface {v10, v11}, Lcom/boyaa/videodemo/listener/TaskListener;->success([B)V

    .line 374
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    goto/16 :goto_0

    .line 376
    .end local v2    # "dataRemain":[B
    :cond_8
    if-ge v7, v6, :cond_9

    .line 378
    const-string v10, "Read Data"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "122 Read iSize = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  iRemain = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    new-array v0, v7, [B

    .line 381
    .restart local v0    # "dataAppend":[B
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v10, v11, v0, v12, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 382
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v11

    invoke-virtual {v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v11

    invoke-static {v11, v0}, Lcom/boyaa/videodemo/utils/ByteUtils;->append([B[B)[B

    move-result-object v11

    invoke-interface {v10, v11}, Lcom/boyaa/videodemo/listener/TaskListener;->success([B)V

    .line 383
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 385
    sub-int v10, v6, v7

    new-array v1, v10, [B

    .line 386
    .local v1, "dataLeft":[B
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    const/4 v11, 0x0

    sub-int v12, v6, v7

    invoke-static {v10, v7, v1, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 388
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->this$0:Lcom/boyaa/videodemo/data/ClientVedio;

    iget-object v11, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-virtual {v10, v1, v11}, Lcom/boyaa/videodemo/data/ClientVedio;->DealLeftData([BLcom/boyaa/videodemo/listener/TaskListener;)V

    goto/16 :goto_0

    .line 391
    .end local v0    # "dataAppend":[B
    .end local v1    # "dataLeft":[B
    :cond_9
    if-le v7, v6, :cond_0

    .line 393
    const-string v10, "Read Data"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "123 Read iSize = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  iRemain = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    new-array v2, v6, [B

    .line 396
    .restart local v2    # "dataRemain":[B
    iget-object v10, p0, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->receiveBuffer:[B

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v10, v11, v2, v12, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 397
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v11

    invoke-virtual {v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v11

    invoke-static {v11, v2}, Lcom/boyaa/videodemo/utils/ByteUtils;->append([B[B)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setData([B)V

    .line 398
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method
