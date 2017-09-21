.class Lcom/baidu/location/e/h$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/baidu/location/e/h;


# direct methods
.method constructor <init>(Lcom/baidu/location/e/h;)V
    .locals 0

    iput-object p1, p0, Lcom/baidu/location/e/h$3;->a:Lcom/baidu/location/e/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    new-instance v0, Landroid/location/Location;

    const-string v1, "GPS"

    invoke-direct {v0, v1}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/baidu/location/e/h$3;->a:Lcom/baidu/location/e/h;

    iget-wide v2, v1, Lcom/baidu/location/e/h;->hg:D

    const-wide v4, 0x3f1d7364111fae6dL    # 1.123456789E-4

    sub-double/2addr v2, v4

    iput-wide v2, v1, Lcom/baidu/location/e/h;->hg:D

    iget-object v1, p0, Lcom/baidu/location/e/h$3;->a:Lcom/baidu/location/e/h;

    iget-wide v2, v1, Lcom/baidu/location/e/h;->ho:D

    const-wide v4, 0x3ee5765e0ae93791L    # 1.02340567E-5

    sub-double/2addr v2, v4

    iput-wide v2, v1, Lcom/baidu/location/e/h;->ho:D

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setTime(J)V

    iget-object v1, p0, Lcom/baidu/location/e/h$3;->a:Lcom/baidu/location/e/h;

    iget-wide v1, v1, Lcom/baidu/location/e/h;->hg:D

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setLongitude(D)V

    iget-object v1, p0, Lcom/baidu/location/e/h$3;->a:Lcom/baidu/location/e/h;

    iget-wide v1, v1, Lcom/baidu/location/e/h;->ho:D

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setLatitude(D)V

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1}, Landroid/location/Location;->setSpeed(F)V

    const/high16 v1, 0x420c0000    # 35.0f

    invoke-virtual {v0, v1}, Landroid/location/Location;->setBearing(F)V

    iget-object v1, p0, Lcom/baidu/location/e/h$3;->a:Lcom/baidu/location/e/h;

    iget v2, v1, Lcom/baidu/location/e/h;->hp:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/baidu/location/e/h;->hp:I

    iget-object v1, p0, Lcom/baidu/location/e/h$3;->a:Lcom/baidu/location/e/h;

    invoke-virtual {v1, v0}, Lcom/baidu/location/e/h;->for(Landroid/location/Location;)V

    iget-object v0, p0, Lcom/baidu/location/e/h$3;->a:Lcom/baidu/location/e/h;

    iget v0, v0, Lcom/baidu/location/e/h;->hp:I

    const/16 v1, 0x14

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/baidu/location/e/h$3;->a:Lcom/baidu/location/e/h;

    invoke-static {v0}, Lcom/baidu/location/e/h;->if(Lcom/baidu/location/e/h;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
