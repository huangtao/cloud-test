.class Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;
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
    name = "ConnectTask"
.end annotation


# instance fields
.field private mIP:Ljava/lang/String;

.field private mListener:Lcom/boyaa/videodemo/listener/TaskListener;

.field private mOutStream:Ljava/io/OutputStream;

.field private mPort:I

.field private mReadTask:Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;

.field private mSocket:Ljava/net/Socket;

.field final synthetic this$0:Lcom/boyaa/videodemo/data/ClientVedio;


# direct methods
.method public constructor <init>(Lcom/boyaa/videodemo/data/ClientVedio;Ljava/net/Socket;Ljava/lang/String;ILcom/boyaa/videodemo/listener/TaskListener;)V
    .locals 0
    .param p2, "socket"    # Ljava/net/Socket;
    .param p3, "ip"    # Ljava/lang/String;
    .param p4, "port"    # I
    .param p5, "listener"    # Lcom/boyaa/videodemo/listener/TaskListener;

    .prologue
    .line 174
    iput-object p1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->this$0:Lcom/boyaa/videodemo/data/ClientVedio;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    iput-object p2, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mSocket:Ljava/net/Socket;

    .line 176
    iput-object p3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mIP:Ljava/lang/String;

    .line 177
    iput p4, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mPort:I

    .line 178
    iput-object p5, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    .line 179
    return-void
.end method


# virtual methods
.method public isOutStreamReady()Z
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mOutStream:Ljava/io/OutputStream;

    if-nez v0, :cond_0

    .line 250
    const/4 v0, 0x0

    .line 251
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mReadTask:Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;

    if-eqz v0, :cond_0

    .line 257
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mReadTask:Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;->release()V

    .line 260
    :cond_0
    return-void
.end method

.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x0

    .line 184
    :try_start_0
    iget-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mIP:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mIP:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_0

    iget v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mPort:I

    if-gtz v3, :cond_1

    .line 221
    :cond_0
    :goto_0
    return-void

    .line 187
    :cond_1
    new-instance v1, Ljava/net/InetSocketAddress;

    iget-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mIP:Ljava/lang/String;

    iget v4, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mPort:I

    invoke-direct {v1, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 188
    .local v1, "remoteAddr":Ljava/net/InetSocketAddress;
    iget-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mSocket:Ljava/net/Socket;

    const/16 v4, 0x7530

    invoke-virtual {v3, v1, v4}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 190
    iget-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mSocket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mOutStream:Ljava/io/OutputStream;

    .line 198
    new-instance v3, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;

    iget-object v4, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->this$0:Lcom/boyaa/videodemo/data/ClientVedio;

    iget-object v5, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mSocket:Ljava/net/Socket;

    iget-object v6, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-direct {v3, v4, v5, v6}, Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;-><init>(Lcom/boyaa/videodemo/data/ClientVedio;Ljava/net/Socket;Lcom/boyaa/videodemo/listener/TaskListener;)V

    iput-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mReadTask:Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;

    .line 199
    new-instance v2, Ljava/lang/Thread;

    iget-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mReadTask:Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 200
    .local v2, "thread":Ljava/lang/Thread;
    const-string v3, "read-thread"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 201
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 204
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    iget-object v3, v3, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    if-eqz v3, :cond_0

    .line 205
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    iget-object v3, v3, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x39

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 207
    .end local v1    # "remoteAddr":Ljava/net/InetSocketAddress;
    .end local v2    # "thread":Ljava/lang/Thread;
    :catch_0
    move-exception v0

    .line 208
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    invoke-virtual {v0}, Ljava/util/concurrent/RejectedExecutionException;->printStackTrace()V

    .line 209
    const-string v3, "ClientAudio"

    const-string v4, "\u8fde\u63a5\u88ab\u62d2\u7edd"

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    iget-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-interface {v3, v0, v8}, Lcom/boyaa/videodemo/listener/TaskListener;->failed(Ljava/lang/Exception;I)V

    .line 212
    sput-boolean v7, Lcom/boyaa/videodemo/utils/Constants;->isOnRecontentAccess:Z

    goto :goto_0

    .line 214
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :catch_1
    move-exception v0

    .line 215
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 216
    const-string v3, "ClientAudio"

    const-string v4, "\u63a7\u5236\u8fde\u63a5\u65ad\u7ebf \u9700\u8981\u91cd\u65b0\u8fde\u63a5"

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    iget-object v3, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    invoke-interface {v3, v0, v8}, Lcom/boyaa/videodemo/listener/TaskListener;->failed(Ljava/lang/Exception;I)V

    .line 219
    sput-boolean v7, Lcom/boyaa/videodemo/utils/Constants;->isOnRecontentAccess:Z

    goto :goto_0
.end method

.method public writeData2Stream([B)V
    .locals 3
    .param p1, "param"    # [B

    .prologue
    .line 226
    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mOutStream:Ljava/io/OutputStream;

    if-nez v1, :cond_0

    .line 227
    const-string v1, "ClientAudio"

    const-string v2, "\u8fde\u63a5\u670d\u52a1\u5668\u5931\u8d25,\u9700\u8981\u91cd\u8fde1.."

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    invoke-static {}, Lcom/boyaa/videodemo/utils/ApiUtils;->reconnectControlConnection()V

    .line 244
    :goto_0
    return-void

    .line 233
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mOutStream:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V

    .line 234
    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mOutStream:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 236
    :catch_0
    move-exception v0

    .line 238
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 239
    const-string v1, "ClientAudio"

    const-string v2, "\u63a7\u5236\u8fde\u63a5\u65ad\u7ebf \u9700\u8981\u91cd\u65b0\u8fde\u63a5"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->mListener:Lcom/boyaa/videodemo/listener/TaskListener;

    const/4 v2, 0x2

    invoke-interface {v1, v0, v2}, Lcom/boyaa/videodemo/listener/TaskListener;->failed(Ljava/lang/Exception;I)V

    .line 242
    const/4 v1, 0x0

    sput-boolean v1, Lcom/boyaa/videodemo/utils/Constants;->isOnRecontentAccess:Z

    goto :goto_0
.end method
