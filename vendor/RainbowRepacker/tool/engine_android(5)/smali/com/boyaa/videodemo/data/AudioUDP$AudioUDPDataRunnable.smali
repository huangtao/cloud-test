.class Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;
.super Ljava/lang/Object;
.source "AudioUDP.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/data/AudioUDP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AudioUDPDataRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/data/AudioUDP;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/data/AudioUDP;)V
    .locals 0

    .prologue
    .line 144
    iput-object p1, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 150
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/data/AudioUDP;->access$4(Lcom/boyaa/videodemo/data/AudioUDP;Z)V

    .line 152
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v1}, Lcom/boyaa/videodemo/data/AudioUDP;->access$1(Lcom/boyaa/videodemo/data/AudioUDP;)Ljava/net/DatagramSocket;

    move-result-object v1

    if-nez v1, :cond_1

    .line 178
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->receiveBuffer:[B
    invoke-static {v1}, Lcom/boyaa/videodemo/data/AudioUDP;->access$5(Lcom/boyaa/videodemo/data/AudioUDP;)[B

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->receiveBuffer:[B
    invoke-static {v2}, Lcom/boyaa/videodemo/data/AudioUDP;->access$5(Lcom/boyaa/videodemo/data/AudioUDP;)[B

    move-result-object v2

    array-length v2, v2

    invoke-direct {v0, v1, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 155
    .local v0, "dp":Ljava/net/DatagramPacket;
    :goto_1
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->isUDPDataRunning:Z
    invoke-static {v1}, Lcom/boyaa/videodemo/data/AudioUDP;->access$6(Lcom/boyaa/videodemo/data/AudioUDP;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 163
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v1}, Lcom/boyaa/videodemo/data/AudioUDP;->access$1(Lcom/boyaa/videodemo/data/AudioUDP;)Ljava/net/DatagramSocket;

    move-result-object v1

    if-nez v1, :cond_2

    .line 165
    const-string v1, "AudioUDP"

    const-string v2, "udp broken!!!"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 176
    .end local v0    # "dp":Ljava/net/DatagramPacket;
    :catch_0
    move-exception v1

    goto :goto_0

    .line 169
    .restart local v0    # "dp":Ljava/net/DatagramPacket;
    :cond_2
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v1}, Lcom/boyaa/videodemo/data/AudioUDP;->access$1(Lcom/boyaa/videodemo/data/AudioUDP;)Ljava/net/DatagramSocket;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 171
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    invoke-virtual {v0}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/boyaa/videodemo/data/AudioUDP;->CheckAudioData([B)V

    .line 173
    const-wide/16 v1, 0x2

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method
