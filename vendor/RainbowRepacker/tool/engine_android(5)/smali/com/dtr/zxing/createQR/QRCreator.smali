.class public Lcom/dtr/zxing/createQR/QRCreator;
.super Ljava/lang/Object;
.source "QRCreator.java"


# static fields
.field private static instance:Lcom/dtr/zxing/createQR/QRCreator;


# instance fields
.field private m_IQRCreatorListener:Lcom/dtr/zxing/createQR/IQRCreatorListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const/4 v0, 0x0

    sput-object v0, Lcom/dtr/zxing/createQR/QRCreator;->instance:Lcom/dtr/zxing/createQR/QRCreator;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/dtr/zxing/createQR/QRCreator;->m_IQRCreatorListener:Lcom/dtr/zxing/createQR/IQRCreatorListener;

    .line 12
    return-void
.end method

.method public static getInstance()Lcom/dtr/zxing/createQR/QRCreator;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/dtr/zxing/createQR/QRCreator;->instance:Lcom/dtr/zxing/createQR/QRCreator;

    if-nez v0, :cond_0

    .line 16
    invoke-static {}, Lcom/dtr/zxing/createQR/QRCreator;->initInstance()V

    .line 18
    :cond_0
    sget-object v0, Lcom/dtr/zxing/createQR/QRCreator;->instance:Lcom/dtr/zxing/createQR/QRCreator;

    return-object v0
.end method

.method private static declared-synchronized initInstance()V
    .locals 2

    .prologue
    .line 22
    const-class v1, Lcom/dtr/zxing/createQR/QRCreator;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/dtr/zxing/createQR/QRCreator;->instance:Lcom/dtr/zxing/createQR/QRCreator;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Lcom/dtr/zxing/createQR/QRCreator;

    invoke-direct {v0}, Lcom/dtr/zxing/createQR/QRCreator;-><init>()V

    sput-object v0, Lcom/dtr/zxing/createQR/QRCreator;->instance:Lcom/dtr/zxing/createQR/QRCreator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :cond_0
    monitor-exit v1

    return-void

    .line 22
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public createQR(Ljava/lang/String;ILjava/lang/String;Landroid/graphics/Bitmap;Lcom/dtr/zxing/createQR/IQRCreatorListener;)V
    .locals 8
    .param p1, "content"    # Ljava/lang/String;
    .param p2, "sideLength"    # I
    .param p3, "imagePath"    # Ljava/lang/String;
    .param p4, "logoBmp"    # Landroid/graphics/Bitmap;
    .param p5, "listener"    # Lcom/dtr/zxing/createQR/IQRCreatorListener;

    .prologue
    .line 35
    iput-object p5, p0, Lcom/dtr/zxing/createQR/QRCreator;->m_IQRCreatorListener:Lcom/dtr/zxing/createQR/IQRCreatorListener;

    .line 38
    new-instance v7, Ljava/lang/Thread;

    new-instance v0, Lcom/dtr/zxing/createQR/QRCreator$1;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p4

    move-object v5, p3

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/dtr/zxing/createQR/QRCreator$1;-><init>(Lcom/dtr/zxing/createQR/QRCreator;Ljava/lang/String;ILandroid/graphics/Bitmap;Ljava/lang/String;Lcom/dtr/zxing/createQR/IQRCreatorListener;)V

    invoke-direct {v7, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 47
    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    .line 48
    return-void
.end method
