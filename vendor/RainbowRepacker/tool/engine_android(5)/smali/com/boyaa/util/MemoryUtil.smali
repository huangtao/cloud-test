.class public Lcom/boyaa/util/MemoryUtil;
.super Ljava/lang/Object;
.source "MemoryUtil.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "MemoryUtil"

.field private static final MEMINFO_Path:Ljava/lang/String; = "/proc/meminfo"

.field private static availMem:Ljava/lang/String;

.field private static totalMem:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/boyaa/util/MemoryUtil;->totalMem:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/boyaa/util/MemoryUtil;->availMem:Ljava/lang/String;

    return-object v0
.end method

.method public static getAvailMemory()Ljava/lang/String;
    .locals 8

    .prologue
    .line 76
    sget-object v4, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v5, "activity"

    invoke-virtual {v4, v5}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 77
    .local v0, "am":Landroid/app/ActivityManager;
    new-instance v3, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v3}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 78
    .local v3, "mi":Landroid/app/ActivityManager$MemoryInfo;
    invoke-virtual {v0, v3}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 80
    iget-wide v4, v3, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    const-wide/32 v6, 0x100000

    div-long v1, v4, v6

    .line 81
    .local v1, "availMem":J
    const-string v4, "MemoryUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "getAvailMemory()--"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static getAvailMemoryForLua()V
    .locals 3

    .prologue
    .line 86
    invoke-static {}, Lcom/boyaa/util/MemoryUtil;->getAvailMemory()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "availMem":Ljava/lang/String;
    const-string v1, "getAvailMemory"

    const-string v2, "availMemory"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    return-void
.end method

.method public static getMemory()V
    .locals 2

    .prologue
    .line 34
    invoke-static {}, Lcom/boyaa/util/MemoryUtil;->getTotalMemory()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/util/MemoryUtil;->totalMem:Ljava/lang/String;

    .line 35
    invoke-static {}, Lcom/boyaa/util/MemoryUtil;->getAvailMemory()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/util/MemoryUtil;->availMem:Ljava/lang/String;

    .line 36
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/util/MemoryUtil$1;

    invoke-direct {v1}, Lcom/boyaa/util/MemoryUtil$1;-><init>()V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 48
    return-void
.end method

.method public static getTotalMemory()Ljava/lang/String;
    .locals 10

    .prologue
    .line 55
    const-wide/16 v5, 0x0

    .line 57
    .local v5, "totalMemory":J
    :try_start_0
    new-instance v3, Ljava/io/FileReader;

    const-string v7, "/proc/meminfo"

    invoke-direct {v3, v7}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 58
    .local v3, "localFileReader":Ljava/io/FileReader;
    new-instance v2, Ljava/io/BufferedReader;

    const/16 v7, 0x2000

    invoke-direct {v2, v3, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 59
    .local v2, "localBufferedReader":Ljava/io/BufferedReader;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 60
    .local v4, "memInfo":Ljava/lang/String;
    const-string v7, "\\s+"

    invoke-virtual {v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, "arrayOfString":[Ljava/lang/String;
    const/4 v7, 0x1

    aget-object v7, v0, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    div-int/lit16 v7, v7, 0x400

    int-to-long v5, v7

    .line 63
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .end local v0    # "arrayOfString":[Ljava/lang/String;
    .end local v2    # "localBufferedReader":Ljava/io/BufferedReader;
    .end local v3    # "localFileReader":Ljava/io/FileReader;
    .end local v4    # "memInfo":Ljava/lang/String;
    :goto_0
    const-string v7, "MemoryUtil"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "getTotalMemory()--"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 64
    :catch_0
    move-exception v1

    .line 65
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
