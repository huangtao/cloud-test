.class public Lcom/boyaa/androidim/utils/Gps;
.super Ljava/lang/Object;
.source "Gps.java"


# instance fields
.field private wgLat:D

.field private wgLon:D


# direct methods
.method public constructor <init>(DD)V
    .locals 0
    .param p1, "wgLat"    # D
    .param p3, "wgLon"    # D

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/boyaa/androidim/utils/Gps;->setWgLat(D)V

    .line 10
    invoke-virtual {p0, p3, p4}, Lcom/boyaa/androidim/utils/Gps;->setWgLon(D)V

    .line 11
    return-void
.end method


# virtual methods
.method public getWgLat()D
    .locals 2

    .prologue
    .line 14
    iget-wide v0, p0, Lcom/boyaa/androidim/utils/Gps;->wgLat:D

    return-wide v0
.end method

.method public getWgLon()D
    .locals 2

    .prologue
    .line 22
    iget-wide v0, p0, Lcom/boyaa/androidim/utils/Gps;->wgLon:D

    return-wide v0
.end method

.method public setWgLat(D)V
    .locals 0
    .param p1, "wgLat"    # D

    .prologue
    .line 18
    iput-wide p1, p0, Lcom/boyaa/androidim/utils/Gps;->wgLat:D

    .line 19
    return-void
.end method

.method public setWgLon(D)V
    .locals 0
    .param p1, "wgLon"    # D

    .prologue
    .line 26
    iput-wide p1, p0, Lcom/boyaa/androidim/utils/Gps;->wgLon:D

    .line 27
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/boyaa/androidim/utils/Gps;->wgLat:D

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/boyaa/androidim/utils/Gps;->wgLon:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
