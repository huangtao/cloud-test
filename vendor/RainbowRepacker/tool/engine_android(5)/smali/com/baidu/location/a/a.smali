.class public Lcom/baidu/location/a/a;
.super Landroid/app/Service;

# interfaces
.implements Lcom/baidu/location/b/f;
.implements Lcom/baidu/location/LLSInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/baidu/location/a/a$a;
    }
.end annotation


# static fields
.field static l7:Lcom/baidu/location/a/a$a;

.field private static mb:J


# instance fields
.field private l6:Landroid/os/HandlerThread;

.field private l8:Z

.field l9:Landroid/os/Messenger;

.field private ma:Landroid/os/Looper;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    sput-object v0, Lcom/baidu/location/a/a;->l7:Lcom/baidu/location/a/a$a;

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/baidu/location/a/a;->mb:J

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/baidu/location/a/a;->l9:Landroid/os/Messenger;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/baidu/location/a/a;->l8:Z

    return-void
.end method

.method public static dO()J
    .locals 2

    sget-wide v0, Lcom/baidu/location/a/a;->mb:J

    return-wide v0
.end method

.method public static dP()Landroid/os/Handler;
    .locals 1

    sget-object v0, Lcom/baidu/location/a/a;->l7:Lcom/baidu/location/a/a$a;

    return-object v0
.end method

.method private dQ()V
    .locals 1

    invoke-static {}, Lcom/baidu/location/h/c;->a()Lcom/baidu/location/h/j;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/h/j;->cS()V

    invoke-static {}, Lcom/baidu/location/e/m;->ba()Lcom/baidu/location/e/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/m;->bb()V

    invoke-static {}, Lcom/baidu/location/e/o;->ci()V

    invoke-static {}, Lcom/baidu/location/e/c;->bq()Lcom/baidu/location/e/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/c;->bs()V

    invoke-static {}, Lcom/baidu/location/e/h;->bJ()Lcom/baidu/location/e/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/h;->bK()V

    iget-boolean v0, p0, Lcom/baidu/location/a/a;->l8:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    :cond_0
    return-void
.end method

.method private dR()V
    .locals 1

    invoke-static {}, Lcom/baidu/location/h/c;->a()Lcom/baidu/location/h/j;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/h/j;->cO()V

    invoke-static {}, Lcom/baidu/location/h/l;->a()Lcom/baidu/location/h/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/h/k;->c5()V

    invoke-static {}, Lcom/baidu/location/b/c;->N()Lcom/baidu/location/b/c;

    invoke-static {}, Lcom/baidu/location/e/m;->ba()Lcom/baidu/location/e/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/m;->bi()V

    invoke-static {}, Lcom/baidu/location/c/b;->aZ()Lcom/baidu/location/c/b;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/c/b;->a0()V

    invoke-static {}, Lcom/baidu/location/e/e;->bw()Lcom/baidu/location/e/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/e;->by()V

    return-void
.end method

.method static synthetic do(Lcom/baidu/location/a/a;)V
    .locals 0

    invoke-direct {p0}, Lcom/baidu/location/a/a;->dR()V

    return-void
.end method

.method static synthetic do(Lcom/baidu/location/a/a;Landroid/os/Message;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/baidu/location/a/a;->m(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic for(Lcom/baidu/location/a/a;Landroid/os/Message;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/baidu/location/a/a;->l(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic if(Lcom/baidu/location/a/a;)V
    .locals 0

    invoke-direct {p0}, Lcom/baidu/location/a/a;->dQ()V

    return-void
.end method

.method static synthetic if(Lcom/baidu/location/a/a;Landroid/os/Message;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/baidu/location/a/a;->n(Landroid/os/Message;)V

    return-void
.end method

.method private l(Landroid/os/Message;)V
    .locals 1

    invoke-static {}, Lcom/baidu/location/e/c;->bq()Lcom/baidu/location/e/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/baidu/location/e/c;->char(Landroid/os/Message;)V

    return-void
.end method

.method private m(Landroid/os/Message;)V
    .locals 2

    const-string v0, "baidu_location_service"

    const-string v1, "baidu location service register ..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/baidu/location/e/c;->bq()Lcom/baidu/location/e/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/baidu/location/e/c;->long(Landroid/os/Message;)V

    invoke-static {}, Lcom/baidu/location/c/d;->try()Lcom/baidu/location/c/d;

    invoke-static {}, Lcom/baidu/location/e/f;->bB()Lcom/baidu/location/e/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/f;->bE()V

    invoke-static {}, Lcom/baidu/location/e/d;->aR()Lcom/baidu/location/e/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/d;->aQ()V

    return-void
.end method

.method private n(Landroid/os/Message;)V
    .locals 1

    invoke-static {}, Lcom/baidu/location/e/c;->bq()Lcom/baidu/location/e/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/baidu/location/e/c;->goto(Landroid/os/Message;)Z

    return-void
.end method


# virtual methods
.method public getVersion()D
    .locals 2

    const-wide v0, 0x4018851ec0000000L    # 6.130000114440918

    return-wide v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "key"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/baidu/location/b/c;->bl:Ljava/lang/String;

    const-string v1, "sign"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/baidu/location/b/c;->bk:Ljava/lang/String;

    const-string v1, "kill_process"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/baidu/location/a/a;->l8:Z

    :cond_0
    iget-object v0, p0, Lcom/baidu/location/a/a;->l9:Landroid/os/Messenger;

    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/baidu/location/a/a;->mb:J

    invoke-static {}, Lcom/baidu/location/e/n;->a()Landroid/os/HandlerThread;

    move-result-object v0

    iput-object v0, p0, Lcom/baidu/location/a/a;->l6:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/baidu/location/a/a;->l6:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/baidu/location/a/a;->ma:Landroid/os/Looper;

    new-instance v0, Lcom/baidu/location/a/a$a;

    iget-object v1, p0, Lcom/baidu/location/a/a;->ma:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/baidu/location/a/a$a;-><init>(Lcom/baidu/location/a/a;Landroid/os/Looper;)V

    sput-object v0, Lcom/baidu/location/a/a;->l7:Lcom/baidu/location/a/a$a;

    new-instance v0, Landroid/os/Messenger;

    sget-object v1, Lcom/baidu/location/a/a;->l7:Lcom/baidu/location/a/a$a;

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/baidu/location/a/a;->l9:Landroid/os/Messenger;

    sget-object v0, Lcom/baidu/location/a/a;->l7:Lcom/baidu/location/a/a$a;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/baidu/location/a/a$a;->sendEmptyMessage(I)Z

    const-string v0, "baidu_location_service"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "baidu location service start1 ..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-static {}, Lcom/baidu/location/h/l;->a()Lcom/baidu/location/h/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/h/k;->dc()V

    invoke-static {}, Lcom/baidu/location/e/i;->bX()Lcom/baidu/location/e/i;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/i;->bZ()V

    invoke-static {}, Lcom/baidu/location/c/d;->try()Lcom/baidu/location/c/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/c/d;->h()V

    invoke-static {}, Lcom/baidu/location/e/f;->bB()Lcom/baidu/location/e/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/f;->bH()V

    invoke-static {}, Lcom/baidu/location/h/d;->a()Lcom/baidu/location/h/g;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/h/g;->cF()V

    invoke-static {}, Lcom/baidu/location/e/e;->bw()Lcom/baidu/location/e/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/location/e/e;->bz()V

    sget-object v0, Lcom/baidu/location/a/a;->l7:Lcom/baidu/location/a/a$a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/baidu/location/a/a$a;->sendEmptyMessage(I)Z

    const-string v0, "baidu_location_service"

    const-string v1, "baidu location service stop ..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onUnBind(Landroid/content/Intent;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
